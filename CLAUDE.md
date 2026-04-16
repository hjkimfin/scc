# SCC Website — CLAUDE.md

## Project Overview

**Strategy Critique Collective (SCC)** is an independent research group publishing short-form critical notes on systematic investment strategies under the series *Critical Review of Investment Strategies* (CRIS).

This repository contains the SCC public website, hosted on GitHub Pages with a custom domain.

## Repository Structure

```
scc/
├── CLAUDE.md
└── scc_website/          # GitHub Pages root (deployed from this directory)
    ├── index.html         # Main landing page
    ├── papers/            # Paper download page and PDF assets
    │   ├── index.html     # Paper listing & download page
    │   └── *.pdf          # Paper PDF files (naming: CRIS-vol-no.pdf)
    └── CNAME              # Custom domain configuration
```

## Design System

- **Color palette**: Dark theme (`--bg: #0e0e0c`, `--cream: #f0ece0`, `--gold: #c8a96e`)
- **Fonts**: Cormorant Garamond (serif headings), IBM Plex Sans (body), IBM Plex Mono (labels/mono)
- **Style**: Minimalist, editorial, no emojis. Gold accents on dark background. Thin borders (`0.5px`).
- **Responsive**: Mobile breakpoint at 768px. Nav links hidden on mobile. Single-column layouts.

## Key Conventions

- All pages are static HTML + inline CSS. No build tools or JS frameworks.
- Paper PDFs follow naming convention: `CRIS-{vol}-{no}.pdf` (e.g., `CRIS-1-3.pdf`)
- New papers: add a `<a class="paper-item">` block to both `index.html` (latest 3) and `papers/index.html` (full list), then place the PDF in `papers/`.
- Labels use `font-family: var(--mono)`, `font-size: 10-11px`, `letter-spacing: 0.15-0.25em`, `text-transform: uppercase`, `color: var(--gold)`.
- Section structure: `<section id="...">` with `.section-label` header, followed by content grid.

## Hosting

- **Platform**: GitHub Pages
- **Source**: `scc_website/` directory on `main` branch
- **Custom domain**: configured via `CNAME` file in `scc_website/`
- **Deploy**: push to `main` → GitHub Actions automatically deploys

## Adding a New Paper

1. Place the PDF in `scc_website/papers/` as `CRIS-{vol}-{no}.pdf`
2. Add entry to `scc_website/papers/index.html` paper list
3. If it's among the latest 3, update `scc_website/index.html` papers section
4. Update the paper links to point to the PDF: `href="papers/CRIS-{vol}-{no}.pdf"`
5. Commit and push to `main`

## Common Tasks

- **Edit landing page**: `scc_website/index.html`
- **Edit paper downloads page**: `scc_website/papers/index.html`
- **Add custom domain**: edit `scc_website/CNAME`
- **Style changes**: all CSS is inline in each HTML file's `<style>` block
