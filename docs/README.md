# Hola Mundo — Documentation

Hola Mundo is a fully static landing page built with Astro
(`output: 'static'` in `astro.config.mjs`). It has a single page,
`src/pages/index.astro`, no backend and no data models of its own.

## Overview

The page renders:

- A hero section with the project name and a waving-hand greeting emoji
  (see [Feature 001](features/001-greeting-emojis.md)).
- A requirements form that POSTs JSON to the endpoint configured via
  `PUBLIC_REQUIREMENTS_ENDPOINT`.
- A footer with a "Powered by Brotea" credit linking to brotea.xyz
  (see [Feature 003](features/003-powered-by-brotea-footer.md)).

## Configuration

| Variable | Purpose |
| --- | --- |
| `PUBLIC_REQUIREMENTS_ENDPOINT` | URL that receives the form's JSON POST: `{project, source, submitted_by, content}`. If unset, the form shows "Submissions are not enabled yet." instead of submitting. |

## Development

```sh
npm install
npm run dev      # local dev server
npm run build    # static output in dist/
npm run preview  # serve the built output
```

## Features

| # | Feature | Status |
| --- | --- | --- |
| [001](features/001-greeting-emojis.md) | Greeting emojis in title and hero heading | Merged ([PR #1](https://github.com/BroteaConnect/hola-mundo/pull/1), commit `851701d`) |
| [003](features/003-powered-by-brotea-footer.md) | "Powered by Brotea" footer credit | Merged ([PR #4](https://github.com/BroteaConnect/hola-mundo/pull/4), commit `7fea097`) |
