# make anticipates a tab not whitespaces indention
PANDOCFLAGS=--pdf-engine=latexmk
LATEXFLAGS=-xelatex
TMPLDIR=templates
TMPLS:=$(wildcard $(TMPLDIR)/*.tex)
OUTPUTS:=$(basename $(notdir $(TMPLS)))

.PHONY: all

all: $(OUTPUTS)

%: $(TMPLDIR)/%.tex
	pandoc details.yml $(PANDOCFLAGS) --pdf-engine-opt=$(LATEXFLAGS) -o $@.pdf --template=$<

# html:
# 	pandoc details.yml --pdf-engine=xelatex -o academic.tex --template=$(TMPLDIR)/academic.tex
# 	xelatex academic.tex
# 	biber academic
# 	xelatex academic.tex
# 	xelatex academic.tex
# 	pandoc --metadata pagetitle="CV" -t html5 -s academic.tex -o academic.html
