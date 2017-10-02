for f in templates/*.tex; do
    pandoc details.yml -o $(basename $f) --template=$f --latex-engine=xelatex
done
latexmk -pdf
latexmk -c
rm *.tex
rm *.bbl
rm *.run.xml
