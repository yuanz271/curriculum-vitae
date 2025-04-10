MAIN=cv

.PHONY: $(MAIN).pdf all clean

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	latexmk -pdfxe -use-make $<

cleanall:
	latexmk -C

clean:
	latexmk -c
