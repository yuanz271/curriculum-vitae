# make anticipates a tab not whitespaces indention
PANDOC=pandoc
LATEX=latexmk
LATEXFLAGS=-xelatex
TEMPDIR=templates

all: academic casual

academic: 
	$(PANDOC) details.yml -o academic.tex --template=$(TEMPDIR)/academic.tex --pdf-engine=xelatex
	$(LATEX) $(LATEXFLAGS) academic.tex

casual: 
	$(PANDOC) details.yml -o casual.tex --template=$(TEMPDIR)/casual.tex --pdf-engine=xelatex
	$(LATEX) $(LATEXFLAGS) casual.tex

clean: 
	$(LATEX) -c
