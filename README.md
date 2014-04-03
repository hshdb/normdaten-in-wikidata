# Normdaten in Wikidata

Dieses git-Repository enthält alle Dateien des Handbuch "Normdaten in Wikidata".

Alle Inhalte können unter den Bedingungen der CC-BY-SA Lizenz weiterverwendet werden.

Das Haupt-Repository liegt bei Penflip.com unter
<https://www.penflip.com/nichtich/normdaten-in-wikidata.git>.

Zum Erzeugen der verschiedenen Ausgabeformate werden `make` und `pandoc`
benötigt, um mit `make html` bzw. `make pdf` auf der Kommandozeile die HTML-
und PDF-Version zu erzeugen.

### Struktur des Handbuch-Repository
 
* Die eigentlichen Inhalte befinden sich in Markdown-Syntax in Dateien mit der Endung `.txt`.
 
* In der der Datei `Contents.txt` ist festgelegt, welche Markdown-Dateien in welcher Reihenfolge letztendlich das Handbuch bilden. Pro Zeile ist ein Dateiname angegeben; Leerzeilen und Zeilen, die mit `>` beginnen, werden ignoriert.
 
* Das Verzeichnis `images/` enthält Bilder.
 
* Das Verzeichnis `layout/` enthält Template- und Stylesheet-Dateien.
 
* Die Dateien `About.txt` und `README.md` enthalten kurze Projektbeschreibungen, die nicht im Handbuch auftauchen.
 
* Die Datei `Makefile` enthält Anweisungen, um aus den Inhaltsdateien das Handbuch in verschiedenen Ausgabeformaten zu erzeugen.

* Das Verzeichnis `scripts/` enthält zusätzliche Programme zur Verwaltung und Erstellung von Übersichten.
 
## Verwendete Markdown-Syntax
 
Die Texte sind in Markdown-Syntax verfasst, wobei sich die konkrete Markdown-Variante aus Anforderungen von *Penflip* und *Pandoc* ergibt. Eine Übersicht dieser beiden Markdown-Varianten gibt es unter:
 
* <https://www.penflip.com/Penflip/help/blob/master/Markdown.txt> für Penflip
* <http://johnmacfarlane.net/pandoc/demo/example9/pandocs-markdown.html> für Pandoc
 
### Verwendete Werkzeuge
 
* <http://penflip.com>
* <http://johnmacfarlane.net/pandoc/>
* <http://github.com>

