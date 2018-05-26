for f in templates/*.tex; do
    pandoc details.yml -o $(basename $f) --template=$f --pdf-engine=xelatex
    if [ $? -eq 0 ]; then
        echo "pandoc --pdf-engine succeeded"
    else
        echo "pandoc --pdf-engine failed"
        echo "use --latex-engine instead"
        pandoc details.yml -o $(basename $f) --template=$f --latex-engine=xelatex
    fi
done
latexmk -xelatex
latexmk -c
# rm *.tex *.bbl *.run.xml *.xdv