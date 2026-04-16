# CRIS LaTeX Template

LaTeX document class for **Critical Review of Investment Strategies** (CRIS), published by Strategy Critique Collective.

## Quick Start

1. Copy `cris.cls` into your working directory (or your local texmf tree).
2. Start your document with `\documentclass{cris}`.
3. See `cris-sample.tex` for a complete example.

## Compiling

### XeLaTeX (recommended, for exact font matching)

```bash
xelatex cris-sample
bibtex  cris-sample
xelatex cris-sample
xelatex cris-sample
```

### pdfLaTeX (fallback, uses substitute fonts)

```bash
pdflatex cris-sample
bibtex   cris-sample
pdflatex cris-sample
pdflatex cris-sample
```

## Fonts

The template uses the following fonts (all freely available from Google Fonts):

| Role | Font | Fallback (pdfLaTeX) |
|------|------|---------------------|
| Headings | Cormorant Garamond Light | EB Garamond |
| Body text | IBM Plex Sans Light | Open Sans |
| Labels / mono | IBM Plex Mono | Inconsolata |

For XeLaTeX, install the fonts system-wide or place them in your project directory.

## Class Options

- `letterpaper` (default) / `a4paper` — page size
- Standard `article` options (`draft`, `final`, etc.) are passed through

## Metadata Commands

| Command | Example | Description |
|---------|---------|-------------|
| `\title{...}` | `\title{Momentum Crashes...}` | Paper title |
| `\author{...}` | `\author{J.~Kim \and H.~Park}` | Author names |
| `\volume{...}` | `\volume{1}` | CRIS volume number |
| `\papernumber{...}` | `\papernumber{3}` | Paper number within volume |
| `\paperyear{...}` | `\paperyear{2025}` | Publication year |
| `\papermonth{...}` | `\papermonth{November}` | Publication month |
| `\shorttitle{...}` | `\shorttitle{Momentum Crashes}` | Running header (right) |
| `\shortauthors{...}` | `\shortauthors{Kim \& Park}` | Running header (left) |
| `\keywords{...}` | `\keywords{momentum, factor}` | Displayed after abstract |
| `\jelcodes{...}` | `\jelcodes{G11, G12}` | JEL classification codes |
| `\correspondence{...}` | `\correspondence{email}` | Corresponding author info |

## Output Naming Convention

Compiled PDFs for publication should be renamed to: `CRIS-{vol}-{no}.pdf` (e.g., `CRIS-1-3.pdf`).

## File Structure

```
template/
├── cris.cls            # Document class
├── cris-sample.tex     # Sample paper
├── cris-sample.bib     # Sample bibliography
├── README.md           # This file
└── figures/            # Place figures here
```

## Citation Style

The class uses `natbib` with author-year citations (`\citet`, `\citep`) and the `plainnat` bibliography style.
