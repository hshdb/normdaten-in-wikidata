# Dies ist ein Makefile (GNU Make) mit Regeln zur Erstellung von Dateien

TITLE=Normdaten in Wikidata
AUTHOR=
DATE=SS 2014

SOURCE_URL=https://www.penflip.com/nichtich/normdaten-in-wikidata
BUILD_DATE=$(shell date)
COMMIT_DATE=$(shell git log -1 --format=%cd)

TXTFILES=$(wildcard *.txt)
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
synopsis: synopsis.md
synopsis.md: $(TXTFILES)
	@perl scripts/synopsis > $@

# ausgewählte Ausgabeformate
html: $(TARGET).html index.html
pdf: $(TARGET).pdf
tex: $(TARGET).tex

TARGET_FILES=$(TARGET).md $(TARGET).html $(TARGET).pdf synopsis.md

# alle Ausgabeformate
.PHONY: clean info deps

all: $(TARGET_FILES)

build: all
	@mkdir -p build
	@cp $(TARGET_FILES) build
	@rsync -rupt --del images build/

clean:
	rm -rf $(TARGET_FILES) build/ *.aux *.log *.lof *.out *.toc

# konkrete Regeln für die jeweiligen Ausgabeformate
.SUFFIXES: .md .pdf .html .tex

PANDOC_OPTIONS=-s -S --toc -N -V build-date="$(BUILD_DATE)" -V commit-date="$(COMMIT_DATE)" -V source-url="$(SOURCE_URL)"
LATEX_OPTIONS=--template layout/template.tex \
			-V fontsize=10pt -V papersize=a5paper \
			--chapters\
			--latex-engine xelatex
HTML_OPTIONS=--template layout/template.html --css layout/buttondown.css --css layout/layout.css --include-before layout/header.html

.md.pdf:
	pandoc $(PANDOC_OPTIONS) -o $@ $(LATEX_OPTIONS) $<

.md.tex:
	pandoc $(PANDOC_OPTIONS) -o $@ $(LATEX_OPTIONS) $<

.md.html:
	pandoc $(PANDOC_OPTIONS) -o $@ $(HTML_OPTIONS) $<
	
# Übersichten
.PHONY: quellen.md

quellen.md:
	./scripts/quellen > quellen.md

index.md: About.txt synopsis.md quellen.md
	cat About.txt > index.md
	echo "* [HTML-Version]($(TARGET).html)" >> index.md
	echo "* [PDF-Version]($(TARGET).pdf)" >> index.md
	echo >> index.md
	cat synopsis.md >> index.md
	echo >> index.md
	cat quellen.md >> index.md

info:
	./scripts/files

# upload build files if ftp.cfg exists
upload: upload-html upload-pdf
upload-html: html ftp.cfg
	ncftpput -R -f ftp.cfg / $(TARGET).html index.html
upload-pdf: ftp.cfg
	make pdf; ncftpput -R -f ftp.cfg / $(TARGET).pdf index.html

pull-and-upload: pull upload

# pull changes from upstream and exit with error if no changes were found
pull:
	@git fetch
	@if [ "$$(git log HEAD..origin/master --oneline)" ] ;\
	 then git merge origin master; rm -f quellen.md ;\
	 else echo "no changes"; exit 1 ; fi


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

# Benötigte Software
deps:
	sudo apt-get install pandoc pandoc-citeproc\
	   	texlive-latex-recommended\
		texlice-fonts-extra texlive-fonts-recommended
