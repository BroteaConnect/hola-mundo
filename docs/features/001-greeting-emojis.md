# Feature 001 — Greeting emojis in title and hero heading

- **PR:** [BroteaConnect/hola-mundo#1](https://github.com/BroteaConnect/hola-mundo/pull/1)
- **Merged into main:** commit `851701d`
- **Scope:** presentational only — a single file changed, `src/pages/index.astro`

## What it does

The waving-hand emoji (👋, `U+1F44B`) now appears in two places:

1. **Browser tab title** — the `<title>` renders as `Hola Mundo 👋`.
2. **Hero heading** — the `<h1>` shows the emoji next to the project name,
   wrapped in an accessible span.

## How it works

The emoji is defined once in the page frontmatter, using a Unicode escape
to avoid any encoding ambiguity:

```astro
---
const GREETING_EMOJI = '\u{1F44B}';
---
```

It is then rendered in the title and the heading:

```astro
<title>{PROJECT_NAME} {GREETING_EMOJI}</title>

<h1>{PROJECT_NAME} <span role="img" aria-label="waving hand">{GREETING_EMOJI}</span></h1>
```

## Accessibility

In the heading, the emoji is wrapped in
`<span role="img" aria-label="waving hand">` so screen readers announce
"waving hand" instead of reading the raw emoji character.

## Verifying

Build the site and check the output contains the emoji:

```sh
npm run build
grep 'waving hand' dist/index.html
```

Expected: `dist/index.html` contains `Hola Mundo 👋` in the `<title>` and
the aria-labeled span in the `<h1>`.

## What did not change

- The requirements form and its POST to `PUBLIC_REQUIREMENTS_ENDPOINT`.
- Styles, endpoints and configuration.
- No data models exist or were added — the site remains fully static.

Note: the page description (`PROJECT_DESCRIPTION`) already contained a 👋
before this feature; this change adds the emoji to the tab title and the
hero heading.
