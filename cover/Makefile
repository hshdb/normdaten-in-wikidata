cover: clean cover.pdf

cover.pdf: frontcover backcover

frontcover: frontcover.pdf
backcover: backcover.pdf

.SUFFIXES: .tex .pdf

.tex.pdf:
	rm -f $@; xelatex $<

clean:
	rm -f *.aux *.log 
