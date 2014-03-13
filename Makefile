# Dies ist ein Makefile mit Regeln zur Erstellung von Dateien

TITLE=Normdaten in Wikidata
AUTHOR=
DATE=SS 2014

# basiert auf allen .txt Dateien
normdaten-in-wikidata.md: *.txt
	@echo '% $(TITLE)' > $@
	@echo '% $(AUTHOR)' >> $@
	@echo '% $(DATE)' >> $@
	@echo >> $@
	@awk '/^[^ >]+\.txt/ {print}' Contents.txt | while read f; do \
		cat $$f >> $@ ;\
		echo >> $@ ;\
	done

# alle Ausgabeformate
all: pdf html

# Augabeformate löschen
.PHONY: clean
clean:
	rm *.html *.tex *.html

# ausgewählte Ausgabeformate
pdf: normdaten-in-wikidata.pdf
tex: normdaten-in-wikidata.tex
html: normdaten-in-wikidata.html

# konkrete Regeln für die jeweiligen Ausgabeformate
.SUFFIXES: .md .pdf .html .tex

PANDOC_OPTIONS=-s -S --toc -N
LATEX_OPTIONS=--template layout/template.tex
HTML_OPTIONS=--template layout/template.html --css layout/buttondown.css

.md.pdf:
	pandoc $(PANDOC_OPTIONS) -o $@ $(LATEX_OPTIONS) $<

.md.tex:
	pandoc $(PANDOC_OPTIONS) -o $@ $(LATEX_OPTIONS) $<

.md.html:
	pandoc $(PANDOC_OPTIONS) -o $@ $(HTML_OPTIONS) $<

