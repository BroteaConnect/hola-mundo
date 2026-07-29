# syntax=docker/dockerfile:1
# Multi-stage: build the static Astro site, serve dist/ with nginx.
# Replaces nixpacks: ~90 MB final image instead of >1 GB, ~4x faster deploys.
FROM node:22-alpine AS build
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci || npm install
COPY . .
# PUBLIC_* vars are inlined into the bundle at build time (C1 contract).
# brotea:build-args
ARG PUBLIC_UMAMI_WEBSITE_ID=""
ENV PUBLIC_UMAMI_WEBSITE_ID=$PUBLIC_UMAMI_WEBSITE_ID
ARG PUBLIC_UMAMI_SRC=""
ENV PUBLIC_UMAMI_SRC=$PUBLIC_UMAMI_SRC
ARG PUBLIC_GLITCHTIP_DSN=""
ENV PUBLIC_GLITCHTIP_DSN=$PUBLIC_GLITCHTIP_DSN
ARG PUBLIC_REQUIREMENTS_ENDPOINT=""
ENV PUBLIC_REQUIREMENTS_ENDPOINT=$PUBLIC_REQUIREMENTS_ENDPOINT
RUN npm run build
# The contact form must never ship dead: fail the build if the endpoint
# did not reach the HTML.
RUN grep -q 'data-endpoint="https://[^"]*"' dist/index.html

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
