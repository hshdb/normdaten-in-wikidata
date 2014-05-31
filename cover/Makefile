cover: clean cover.pdf

cover.pdf: frontcover backcover
cover.png: cover.pdf
	convert -density 300 $< $@

frontcover: frontcover.pdf
backcover: backcover.pdf

.SUFFIXES: .tex .pdf .png

.tex.pdf:
	rm -f $@; xelatex $<

.pdf.png:
	convert -density 96 $< $@

clean:
	rm -f *.aux *.log 
