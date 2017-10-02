for f in templates/*.tex; do
    echo $f
    pandoc details.yml -o cv_$(basename $f) --template=$f --latex-engine=xelatex
done
# pandoc details.yml -o ./cv_academic.tex --template=./templates/academic.tex --latex-engine=xelatex
# pandoc details.yml -o ./cv_casual.tex --template=./templates/casual.tex --latex-engine=xelatex
latexmk -pdf
latexmk -c
rm *.tex
rm *.bbl
rm *.run.xml
