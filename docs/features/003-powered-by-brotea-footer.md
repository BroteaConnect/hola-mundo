# Feature 003 — "Powered by Brotea" footer credit

- **PR:** [BroteaConnect/hola-mundo#4](https://github.com/BroteaConnect/hola-mundo/pull/4)
- **Merged into main:** commit `7fea097`
- **Scope:** presentational only — a single file changed, `src/pages/index.astro`

## What it does

The page now has a footer with a "Powered by Brotea" credit that links to
the Brotea website. The link opens in a new tab.

## How it works

The `<footer>` is inserted after the closing `</main>` tag, before the
page `<script>`:

```html
<footer>
  <p>
    Powered by
    <a href="https://brotea.xyz" target="_blank" rel="noopener noreferrer">Brotea</a>
  </p>
</footer>
```

Matching rules were added to the existing scoped `<style>` block, reusing
the page's tokens (640px content width, `#555` secondary text, `#1a7f37`
brand green):

```css
footer { max-width: 640px; margin: 0 auto; padding: 2rem 1.5rem; text-align: center; font-size: .85rem; color: #555; }
footer a { color: #1a7f37; }
```

## Accessibility

- The `<footer>` sits outside `<main>` at the top level of `<body>`, so
  screen readers announce it as the `contentinfo` landmark.
- The link uses `rel="noopener noreferrer"` alongside `target="_blank"`.
- The link color `#1a7f37` on the `#fafafa` background passes WCAG AA
  contrast for normal text (~4.9:1) at the footer's `.85rem` size.

## Verifying

Build the site and check the output contains the footer credit:

```sh
npm run build
grep -o 'Powered by' dist/index.html
grep -o 'rel="noopener noreferrer"' dist/index.html
```

Expected: `dist/index.html` contains the `<footer>` with the
`https://brotea.xyz` link, `target="_blank"` and
`rel="noopener noreferrer"`.

## What did not change

- The hero section and the requirements form, including its POST to
  `PUBLIC_REQUIREMENTS_ENDPOINT`.
- Endpoints and configuration.
- No data models exist or were added — the site remains fully static.
