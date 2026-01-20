# PROJECT KNOWLEDGE BASE

**Generated:** 2026-01-20
**Commit:** ece0486
**Branch:** main

## OVERVIEW

LaTeX-based curriculum vitae for Yuan Zhao (Research Scientist, NIMH). Compiles to PDF via XeTeX/latexmk with GitHub Actions CI.

## STRUCTURE

```
./
├── cv.tex          # Main document source
├── cv.pdf          # Compiled output (committed)
├── Makefile        # Build orchestration
├── .github/
│   └── workflows/
│       └── main.yml  # CI: auto-build on push to main
└── cv.*            # Build artifacts (aux, log, fls, etc.)
```

## WHERE TO LOOK

| Task | Location | Notes |
|------|----------|-------|
| Edit CV content | `cv.tex` | Sections: Experience, Education, Publications, Talks |
| Change PDF styling | `cv.tex` lines 1-60 | Packages, geometry, fonts, hyperref config |
| Fix build issues | `Makefile` | Uses `latexmk -pdfxe` |
| CI/deployment | `.github/workflows/main.yml` | Installs texlive-xetex on Ubuntu |

## CONVENTIONS

- **Engine:** XeTeX (not pdfLaTeX) — required for fontspec
- **Build:** Always use `make` (not direct latexmk) for consistency
- **Fonts:** TeX Gyre Pagella (tgpagella), monospace default
- **Layout:** Letter paper, 1in left / 1.5in right margins
- **Artifacts in root:** Build outputs (aux, log, xdv) live in root, not separate build dir

## ANTI-PATTERNS

- **NEVER** use pdflatex — fontspec requires XeTeX/LuaTeX
- **NEVER** edit cv.pdf directly — always regenerate from cv.tex
- **AVOID** adding new packages without testing CI (Ubuntu texlive may lack them)

## COMMANDS

```bash
# Build PDF locally
make

# Clean auxiliary files (keep PDF)
make clean

# Clean everything including PDF
make cleanall
```

## NOTES

- `cv.pdf` is committed to repo (unusual but intentional — allows direct download)
- CI runs on every push to main, rebuilds PDF
- Some font warnings in cv.log are expected (EB Garamond substitutions)
- Equal contribution marked with * in publications
