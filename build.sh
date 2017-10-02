pandoc details.yml -o cv_academic.tex --template=templates/academic.tex --latex-engine=xelatex
pandoc details.yml -o cv_casual.tex --template=templates/casual.tex --latex-engine=xelatex
latexmk -pdf
latexmk -c
rm cv_academic.tex
rm cv_casual.tex
