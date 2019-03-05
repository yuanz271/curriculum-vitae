# make anticipates a tab not whitespaces indention
PANDOCFLAGS=--pdf-engine=latexmk
LATEXFLAGS=-xelatex
TMPLDIR=templates

all: academic casual

academic: 
	pandoc details.yml $(PANDOCFLAGS) --pdf-engine-opt=$(LATEXFLAGS) -o academic.pdf --template=$(TMPLDIR)/academic.tex

casual: 
	pandoc details.yml $(PANDOCFLAGS) --pdf-engine-opt=$(LATEXFLAGS) -o casual.pdf --template=$(TMPLDIR)/casual.tex

clean: 
	latexmk -C
