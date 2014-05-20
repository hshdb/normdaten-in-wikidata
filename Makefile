# Dies ist ein Makefile (GNU Make) mit Regeln zur Erstellung von Dateien

TITLE=Normdaten in Wikidata
AUTHOR=
DATE=

SOURCE_URL=https://www.penflip.com/nichtich/normdaten-in-wikidata
BUILD_DATE=$(shell date)
COMMIT_DATE=$(shell git log -1 --format=%cd)

TXT=$(wildcard *.txt)
MAIN=normdaten-in-wikidata

metadata:
	@echo '% $(TITLE)' > $@
	@echo '% $(AUTHOR)' >> $@
	@echo '% $(DATE)' >> $@
	@echo >> $@

$(MAIN).md: metadata $(TXT)
	@cp metadata $@
	@cp properties-table.txt properties.txt
	@awk '/^[^ >]+\.txt/ {print}' Contents.txt | while read f; do \
		cat $$f >> $@ ; echo >> $@ ;\
	done

tex: $(MAIN).tex
$(MAIN).tex: metadata $(TXT)
	@cp metadata $(MAIN).md
	@cp properties-list.txt properties.txt
	@awk '/^[^ >]+\.txt/ {print}' Contents.txt | while read f; do \
		sed 's/<div class="example">/XXXXXX/;s/<\/div>/YYYYYY/' $$f >> $(MAIN).md ;\
	   	echo >> $(MAIN).md ;\
	done
	pandoc $(PANDOC_OPTIONS) -o $@ $(LATEX_OPTIONS) $(MAIN).md
	cp properties-table.txt properties.txt
	perl -pi -e 'BEGIN{undef $$/;} s/\\href{([^}]+)}{([^\\}]+)}/\\hreffn{\1}{\2}/sgm' $@
	perl -pi -e 's/XXXXXX/\\begin{merkbox}/;s/YYYYYY/\\end{merkbox}/;' $@


pdf: $(MAIN).pdf
$(MAIN).pdf: $(MAIN).tex
	xelatex $< && xelatex $< && xelatex $<
	
# PDF-Version
.PHONY: a4
a4: 
	pdfnup $(MAIN).pdf --nup '2x1' --a4paper --openright true --suffix a4 

# Übersicht
synopsis: synopsis.md
synopsis.md: $(TXT)
	@perl scripts/synopsis > $@

# ausgewählte Ausgabeformate
html: $(MAIN).html index.html
tex: $(MAIN).tex
docx: $(MAIN).docx

MAIN_FILES=$(MAIN).md $(MAIN).html $(MAIN).pdf synopsis.md

# alle Ausgabeformate
.PHONY: clean info deps

all: $(MAIN_FILES)

build: all
	@mkdir -p build
	@cp $(MAIN_FILES) build
	@rsync -rupt --del images build/

clean:
	rm -rf $(MAIN_FILES) build/ *.aux *.log *.lof *.out *.toc

# konkrete Regeln für die jeweiligen Ausgabeformate
.SUFFIXES: .md .pdf .html .tex .docx

PANDOC_OPTIONS=-s -S --toc -N -V build-date="$(BUILD_DATE)" -V commit-date="$(COMMIT_DATE)" -V source-url="$(SOURCE_URL)"
LATEX_OPTIONS=--template layout/template.tex \
			--chapters\
			--latex-engine xelatex
HTML_OPTIONS=--template layout/template.html --css layout/buttondown.css --css layout/layout.css --include-before layout/header.html
ODT_OPTIONS=

.md.html:
	pandoc $(PANDOC_OPTIONS) -o $@ $(HTML_OPTIONS) $<

.md.docx:
	pandoc $(PANDOC_OPTIONS) -t docx -o $@ $(ODT_OPTIONS) $<

# Snapshot zum Korrekturlesen mit Annotator
SNAPSHOT_OPTIONS = -V snapshot=1

snapshot.html: $(MAIN).md 
	pandoc $(PANDOC_OPTIONS) -o $@ $(HTML_OPTIONS) $(SNAPSHOT_OPTIONS) $<

TODAY=`date +%F`
snapshot: snapshot.html
	cp snapshot.html build/$(TODAY).html


index.md: About.txt synopsis.md
	cat About.txt > index.md
	echo "* [HTML-Version]($(MAIN).html)" >> index.md
	echo "* [PDF-Version]($(MAIN).pdf)" >> index.md
	echo >> index.md
	cat synopsis.md >> index.md
	echo >> index.md

info:
	./scripts/files

# upload build files if ftp.cfg exists
upload: upload-html upload-pdf upload-docx
upload-html: html ftp.cfg
	ncftpput -R -f ftp.cfg / $(MAIN).html index.html
upload-pdf: ftp.cfg
	make pdf; ncftpput -R -f ftp.cfg / $(MAIN).pdf
upload-docx: ftp.cg
	make docx; ncftpput -R -f ftp.cfg / $(MAIN).docx

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
