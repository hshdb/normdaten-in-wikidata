cover: clean cover.pdf

cover.pdf: frontcover backcover
cover.png: cover.pdf
	convert -density 300 $< $@

frontcover: frontcover.pdf
backcover: backcover.pdf

.SUFFIXES: .tex .pdf

.tex.pdf:
	rm -f $@; xelatex $<

clean:
	rm -f *.aux *.log 
