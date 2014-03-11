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
	@awk '/^[a-z]/ {print}' Contents.txt | while read f; do \
		cat $$f >> $@ ;\
		echo >> $@ ;\
	done

pdf: normdaten-in-wikidata.pdf
html: normdaten-in-wikidata.html

.SUFFIXES: .md .pdf .html

PANDOC_OPTIONS=-s -S --toc
.md.pdf:
	pandoc $(PANDOC_OPTIONS) -o $@ $<

.md.html:
	pandoc $(PANDOC_OPTIONS) -o $@ --css layout.css $<
