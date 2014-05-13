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
	@cp properties-table.txt properties.txt
	@echo '% $(TITLE)' > $@
	@echo '% $(AUTHOR)' >> $@
	@echo '% $(DATE)' >> $@
	@echo >> $@
	@awk '/^[^ >]+\.txt/ {print}' Contents.txt | while read f; do \
		cat $$f >> $@ ;\
		echo >> $@ ;\
	done

pdf: $(TARGET).pdf

$(TARGET).pdf: $(TXTFILES)
	@cp properties-list.txt properties.txt
	@echo '% $(TITLE)' > $(TARGET).md
	@echo '% $(AUTHOR)' >> $(TARGET).md
	@echo '% $(DATE)' >> $(TARGET).md
	@echo >> $(TARGET).md
	@awk '/^[^ >]+\.txt/ {print}' Contents.txt | while read f; do \
		cat $$f >> $(TARGET).md ;\
		echo >> $(TARGET).md ;\
	done
	pandoc $(PANDOC_OPTIONS) -o $@ $(LATEX_OPTIONS) $(TARGET).md
	cp properties-table.txt properties.txt
	

# Übersicht
synopsis: synopsis.md
synopsis.md: $(TXTFILES)
	@perl scripts/synopsis > $@

# ausgewählte Ausgabeformate
html: $(TARGET).html index.html
tex: $(TARGET).tex
docx: $(TARGET).docx

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
.SUFFIXES: .md .pdf .html .tex .docx

PANDOC_OPTIONS=-s -S --toc -N -V build-date="$(BUILD_DATE)" -V commit-date="$(COMMIT_DATE)" -V source-url="$(SOURCE_URL)"
LATEX_OPTIONS=--template layout/template.tex \
			-V fontsize=10pt -V papersize=a5paper \
			--chapters\
			--latex-engine xelatex
HTML_OPTIONS=--template layout/template.html --css layout/buttondown.css --css layout/layout.css --include-before layout/header.html
ODT_OPTIONS=

.md.pdf:
	pandoc $(PANDOC_OPTIONS) -o $@ $(LATEX_OPTIONS) $<

.md.tex:
	pandoc $(PANDOC_OPTIONS) -o $@ $(LATEX_OPTIONS) $<

.md.html:
	pandoc $(PANDOC_OPTIONS) -o $@ $(HTML_OPTIONS) $<

.md.docx:
	pandoc $(PANDOC_OPTIONS) -t docx -o $@ $(ODT_OPTIONS) $<

# PDF-Version
a4: $(TARGET).pdf
	pdfnup $(TARGET).pdf --nup '2x1'

# Snapshot zum Korrekturlesen mit Annotator
SNAPSHOT_OPTIONS = -V snapshot=1

snapshot.html: $(TARGET).md 
	pandoc $(PANDOC_OPTIONS) -o $@ $(HTML_OPTIONS) $(SNAPSHOT_OPTIONS) $<

TODAY=`date +%F`
snapshot: snapshot.html
	cp snapshot.html build/$(TODAY).html


index.md: About.txt synopsis.md
	cat About.txt > index.md
	echo "* [HTML-Version]($(TARGET).html)" >> index.md
	echo "* [PDF-Version]($(TARGET).pdf)" >> index.md
	echo >> index.md
	cat synopsis.md >> index.md
	echo >> index.md

info:
	./scripts/files

# upload build files if ftp.cfg exists
upload: upload-html upload-pdf upload-docx
upload-html: html ftp.cfg
	ncftpput -R -f ftp.cfg / $(TARGET).html index.html
upload-pdf: ftp.cfg
	make pdf; ncftpput -R -f ftp.cfg / $(TARGET).pdf
upload-docx: ftp.cg
	make docx; ncftpput -R -f ftp.cfg / $(TARGET).docx

pull-and-upload: pull upload

# pull changes from upstream and exit with error if no changes were found
pull:
	@git fetch
	@if [ "$$(git log HEAD..origin/master --oneline)" ] ;\
	 then git merge origin master; \
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
		texlive-fonts-extra texlive-fonts-recommended
