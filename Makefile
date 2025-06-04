#
# Simple Makefile to build PDF version.
# Uses `latexmk` (https://ctan.org/pkg/latexmk?lang=en)
#

# PDF viewer. Another alternatives are `xpdf` for Lunux
# On MacOS you can just use `open` to invoke default
# system viewer.
PDFVIEWER=evince

all: build/thesis.pdf

clean:
	rm -rf build

build/thesis.pdf: thesis.tex cmu-ece-thesis.sty thesis.bib *.tex sections/body.tex sections/*/*.tex
	latexmk -g --pdf -output-directory=build -latexoption=-shell-escape thesis.tex

run: thesis.pdf
	$(PDFVIEWER) thesis.pdf
