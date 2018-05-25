for f in templates/*.tex; do
    pandoc details.yml -o $(basename $f) --template=$f --pdf-engine=xelatex
done
latexmk -xelatex
latexmk -c
# rm *.tex *.bbl *.run.xml *.xdv