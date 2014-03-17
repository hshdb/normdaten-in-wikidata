# Dies ist ein Makefile (GNU Make) mit Regeln zur Erstellung von Dateien

TITLE=Normdaten in Wikidata
AUTHOR=
DATE=SS 2014

SOURCE_URL=https://www.penflip.com/nichtich/normdaten-in-wikidata
BUILD_DATE=$(shell date)
COMMIT_DATE=$(shell git log -1 --format=%cd)

TXTFILES=$(filter-out synopsis.txt,$(wildcard *.txt))
TARGET=normdaten-in-wikidata

# basiert auf allen .txt Dateien
normdaten-in-wikidata.md: $(TXTFILES)
	@echo '% $(TITLE)' > $@
	@echo '% $(AUTHOR)' >> $@
	@echo '% $(DATE)' >> $@
	@echo >> $@
	@awk '/^[^ >]+\.txt/ {print}' Contents.txt | while read f; do \
		cat $$f >> $@ ;\
		echo >> $@ ;\
	done

# Übersicht
synopsis: synopsis.txt
synopsis.txt: $(TXTFILES)
	echo "Letzte Änderung: $(COMMIT_DATE)" > $@
	echo "Erstellungszeit: $(BUILD_DATE)" >> $@
	echo "---" >> $@
	perl layout/synopsis.pl >> $@

# ausgewählte Ausgabeformate
html: $(TARGET).html
pdf: $(TARGET).pdf
tex: $(TARGET).tex

TARGET_FILES=$(TARGET).md $(TARGET).html $(TARGET).pdf synopsis.txt

# alle Ausgabeformate
.PHONY: clean

all: $(TARGET_FILES)
build: all
	@mkdir -p build
	@cp $(TARGET_FILES) build
	@rsync -rupt --del images build/

clean:
	rm -rf $(TARGET_FILES) build/

# konkrete Regeln für die jeweiligen Ausgabeformate
.SUFFIXES: .md .pdf .html .tex

PANDOC_OPTIONS=-s -S --toc -N -V build-date="$(BUILD_DATE)" -V commit-date="$(COMMIT_DATE)" -V source-url="$(SOURCE_URL)"
LATEX_OPTIONS=--template layout/template.tex
HTML_OPTIONS=--template layout/template.html --css layout/buttondown.css --css layout/layout.css

.md.pdf:
	pandoc $(PANDOC_OPTIONS) -o $@ $(LATEX_OPTIONS) $<

.md.tex:
	pandoc $(PANDOC_OPTIONS) -o $@ $(LATEX_OPTIONS) $<

.md.html:
	pandoc $(PANDOC_OPTIONS) -o $@ $(HTML_OPTIONS) $<
	

website: build
	@if [ "$$(git status -s)" ]; then \
		git status -s ; \
	else \
		git checkout gh-pages ; \
		cp build/* . 2>/dev/null ; \
		rsync -rupt --del build/images/ images ; \
		git add --all ; \
		if [ "$$(git status -s)" ]; then \
			git commit -m "snapshot" ; \
		else \
			echo "nothing to commit." ; \
		fi ; \
		git checkout -f master; \
	fi

