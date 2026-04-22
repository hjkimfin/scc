# SCC Essay Template

LaTeX document class for short critical essays published by **Strategy Critique Collective** (SCC).

The class is deliberately minimal. No journal banner, no volume/issue furniture, no JEL codes — just a title, an author, a date, a lede, and readable sections.

## Quick start

1. Copy `scc.cls` into your working directory (or a local `texmf` tree).
2. Start your document with `\documentclass{scc}`.
3. See `scc-sample.tex` for a working example.

## Compiling

### XeLaTeX (recommended, for exact font matching)

```bash
xelatex scc-sample
bibtex  scc-sample
xelatex scc-sample
xelatex scc-sample
```

### pdfLaTeX (fallback, uses substitute fonts)

```bash
pdflatex scc-sample
bibtex   scc-sample
pdflatex scc-sample
pdflatex scc-sample
```

## Fonts

| Role | Font | Fallback (pdfLaTeX) |
|------|------|---------------------|
| Headings | Cormorant Garamond | EB Garamond |
| Body text | IBM Plex Sans Light | Open Sans |
| Labels / mono | IBM Plex Mono | Inconsolata |

All primary fonts are freely available from Google Fonts. For XeLaTeX, install them system-wide or place them in your project directory.

## Class options

- `letterpaper` (default) / `a4paper` — page size
- Standard `article` options (`draft`, `final`, etc.) are passed through

## Metadata commands

| Command | Example | Description |
|---------|---------|-------------|
| `\title{...}` | `\title{What momentum research glosses over}` | Essay title |
| `\author{...}` | `\author{J.~Kim \and H.~Park}` | Author(s) |
| `\essaynumber{...}` | `\essaynumber{04}` | Sequence number shown on title (optional) |
| `\paperdate{...}` | `\paperdate{December 2025}` | Date shown on title |
| `\shorttitle{...}` | `\shorttitle{Gross momentum}` | Running header (right) |
| `\shortauthors{...}` | `\shortauthors{Kim \& Park}` | Running header (left) |
| `\keywords{...}` | `\keywords{momentum, costs}` | Muted keyword line after the summary (optional) |

The `abstract` environment is kept by name but is styled as a quiet lede paragraph — not a boxed, headed abstract.

## Output filename convention

PDFs for publication on the site are named `CRIS-{vol}-{no}.pdf` (e.g. `CRIS-1-4.pdf`). This is an internal identifier for the archive; it is not surfaced to readers.

## File structure

```
template/
├── scc.cls             # Document class
├── scc-sample.tex      # Sample essay
├── scc-sample.bib      # Sample bibliography
├── README.md           # This file
└── figures/            # Place figures here
```

## Citation style

`natbib` with author-year citations (`\citet`, `\citep`) and the `plainnat` bibliography style.
