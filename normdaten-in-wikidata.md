% Normdaten in Wikidata
% 
% SS 2014

# Vorwort {.unnumbered}

Wikidata ist eine Wissensdatenbank, welche die reale Welt beschreibt und abbildet.
[Wikidata](http://wikidata.org)


# Abkürzungsverzeichnis {.unnumbered}

...

# Inhaltsverzeichnis {.unnumbered}

Das Inhaltsverzeichnis wird letzendlich automatisch aus der Kapitelstruktur erzeugt. Diese Datei kann als Platzhalter dienen, um die vorgesehene Kapitelstruktur zu bearbeiten.

* Vorwort
* Abkürzungsverzeichnis
* **1. Einleitung**
* **2. Wikidata**
* 2.1. Definition
* 2.1.1. Wikidata
* 2.1.2. Daten
* 2.1.3. Objekt (item)
* 2.1.4. Aussage
* 2.2. Entstehung (Merkkasten?)
* 2.3. ...
* **3. Normdaten**
* 3.1. Definition
* 3.2. Entstehung (Merkkasten?)
* **4. Normdaten in Wikidata**
* 4.1. Unterschied zwischen Normdaten in Wikidata und anderen Normdaten
* 4.2. Normdaten-Eigenschaften in Wikidata
* 4.3. Möglichkeiten 
* 4.4. Grenzen	
* **5. Praktische Anwendung**
* 5.1. Inhalte finden in Wikidata
* 5.2. Datenobjekt erstellen // häufige Fehler --> Icon?
* 5.3. ...
* 5.4 ...
* **6. FAQ**
* Stichwortverzeichnis
* Glossar
* Literaturverzeichnis
* Abbildungsverzeichnis
* Tabellenverzeichnis


# Einleitung

Die Einleitung soll kurz Erklären, was das ganze soll. *Warum* Wikidata?

## Warum Wikidata?

Wikidata ist der Name einer frei bearbeitbaren Datenbank, die unter anderem das Ziel hat, Wikipedia zu unterstützen.Das Projekt wurde von Wikimedia Deutschland gestartet und stellt als gemeinsame Quelle bestimmte Datentypen für Wikimedia-Projekte bereit, zum Beispiel Geburtsdaten oder sonstige allgemeingültige Daten, die in allen Artikeln der Wikimedia-Projekte verwendet werden können.

# Wikidata
## Definition
Wikidata ist nach dem einem Motto "Die freie Wissensdatenbank die jeder bearbeiten kann". Es zählt zu den Wikiprojekten der Wikimedia Foundation mit dem Urheberrecht bei Wikimedia. Ziel ist eine strukturierte Zentralisierung von Daten und Fakten. 

Da Wikidata eine sekundäre Datenbank ist, kann es über Links mit u.a. Wikipedia verknüpft werden. Dadurch bietet sich die Möglichkeit, die Quellen zu überprüfen.

Sie ist seit 2012 online auf [Wikidata](www.wikidata.com) abrufbar. Ähnlich wie Wikipedia ist sie in mehreren Sprachen verfügbar und für jeden lesbar. 
Lediglich zum bearbeiten wird ein kostenloses Benutzerkonto benötigt.
  










## Entstehung

Das Projekt *Wikidata* wurde im April 2012 durch die *Wikimedia Foundation* ins Leben gerufen und von *Wikimedia Deutschland* bearbeitet. Finanziert wurde es mithilfe von Spenden, u.a. von Google.

Offizieller Start war allerdings erst im Oktober 2012. Um dem Projekt eine Struktur zu geben, wurde es in drei Phasen aufgeteilt. 

Zuerst wurden Sprachlinks von Wikipedia-Beiträgen in Wikidata zu 
Datenobjekten und mit Beschreibungen und Bezeichnungen versehen. Um dies zu vereinfachen, wurden automatische Computerskripte (*Bots*) verwendet.
Ab März 2013 waren dann alle Sprachversionen freigeschaltet.

Der nächste Schritt beinhaltete, dass Aussagen zu den Datenobjekten hinzugefügt werden konnten. Dies geschah u.a. ebenfalls mit Bots und dem Datenfundament aus Wikipedia-Infoboxen und -Kategorien.

Der letzte Schritt ist noch in Bearbeitung. Es soll ermöglicht werden, dass Listen automatisch erstellt und Fakten aktualisiert werden. 

Ziel des Projektes ist es, dass Infoboxen entstehen die in einer zentralen Datenbank gespeichert sind und dass alle Wikimedia-Projekte darauf zugreifen können.
 

# Normdaten

*Erklärungsteil Normdaten (mit Beispielen)*

## Definition

Normdaten bestehen aus normierten Begriffen (kontrolliertes Vokabular) mit denen eindeutig auf verschiedene Objekte (bspw. Orte, Person, Themen, Organisationen etc.) verwiesen werden kann. Die einzelnen Einträge oder Datensätze einer Normdatei werden auch als "Deskriptor" oder "Schlagwort" bezeichnet. Normdaten werden beispielsweise in Bibliotheken zur Verschlagwortung/Indexierung von Literatur eingesetzt. Beispiele für Normdateien sind die GND, Klassifikationen (z.B. ICD-10) , Thesauri (z.B. Art & Architecture Thesaurus). Einzelne Normdatensätze werden in einer Normdatei durch eindeutige Benennungen (bspw. "PKW" statt "Auto") oder durch ID-Nummern identifiziert.

**Beispiel:**

~~~
ID: http://d-nb.info/gnd/4023349-2
Geografikum (Ort): Hannover
Andere Bezeichnung: 
  Oberstadtdirektor <Hannover> (Spitzenorgan)
  Hannover / Referat für Stadtentwicklung (Spitzenorgan)
  Hannover / Oberbürgermeister (Spitzenorgan)
Definition: 
  Hauptstadt des Landes Niedersachsen, Verwaltungssitz der  Region Hannover, 1150 als Marktsiedlung Hanovere urkundl. erwähnt, 1202  Stadtrecht
Land:  Niedersachsen (XA-DE-NI); Deutschland, Deutsches Reich (XA-DXDE)
DDC-Notation: T2--435954
Typ: Gebietskörperschaft, Verwaltungseinheit (gik)
Urheber von: 
  ...
Beteiligt an:
  ...    
Thema in:
  ...    
~~~
Quelle: http://d-nb.info/gnd/4023349-2/about/html vom 11.03.2014

# Normdaten in Wikidata

...

## Normdaten-Eigenschaften in Wikidata
In Wikidata sind bereits mehrere _Eigenschaften_ zum Verlinken von Wikidata-Items und anderen Normdateien vorgesehen. So gibt es beispielsweise die Eigenschaft "GND-Nummer ([P227](https://www.wikidata.org/wiki/Property:P227))" zum Verlinken auf die Gemeinsame Normdatei und die Eigenschaft "DDC ([P1036](https://www.wikidata.org/wiki/Property:P1036))" zum Verlinken auf die Dewey-Dezimalklassifikation.

*...Beispiel...*

*...vorhandene Normdaten-Eigenschaften...*

*...wie lässt sich nach Normdaten-Eigenschaften suchen...*

*...wie können weitere Normdaten-Eigenschaften hinzugefügt werden...*

*...wie können vorhandene Verlinkungen abgefragt werden...

----
*Siehe <https://www.wikidata.org/wiki/User:JakobVoss/Authority_control> für eine Vorläufige Liste*

# Praktische Anwendung

## Inhalte finden in Wikidata

Wie arbeitet die Suche?

Die beiden wichtigsten Möglichkeiten sind Suche (die umfassendste Suche über Sprachgrenzen hinweg) und Datenobjekte nach Titel, die nach einem Datensatz zu einem Wikipedia-Artikel in der ausgewählten Sprache sucht. Hier muss der Titel genau gleich sein wie der Eintrag, den du suchst. Bitte probiere beide Möglichkeiten aus, damit du einen Eintrag auch wirklich findest. 

* [Hilfe:editieren](https://www.wikidata.org/w/index.php?title=Help:Editing/de&oldid=94855342)
* [How To Edit Wikidata](http://upload.wikimedia.org/wikipedia/commons/9/94/How_to_Edit_Wikidata.pdf)

![objekterstellen2.png](images/objekterstellen2.png)

Bevor man ein neues Objekt erstellt, sollte man überprüfen, ob das Datenobjekt, welches man erstellen möchte, [bereits existiert](https://www.wikidata.org/wiki/Special:ItemByTitle).

In das Suchfeld "Website" gibt man die Sprachzugehörigkeit ein, in der man suchen möchte. Mit "Seite" sucht man nach dem Titel/Bezeichnung des Objekts.

Wenn das Objekt noch nicht vorhanden ist, bekommt man die Möglichkeit, ein neues Datenobjekt zu erstellen. Man wird mit einem Link auf die Erstellerseite weitergeleitet. Dort muss einmal die Bezeichnung sowie die Beschreibung des zu erstellenden Objekst eingetragen werden. Ist dies geschehen, kommt man auf die Objektseite.

![objektseite.png](images/objektseite.png)

Auf dieser Objektseite hat man die Möglichkeit, Änderungen vorzunehmen oder weitere Sprachen bzw. Übersetzungen für die Objektbezeichnung hinzuzufügen.

Datenobjekte bestehen i.d.R. aus einer Vielzahl von Aussagen. Diese enthalten Informationen über die reale Welt und sind der Kernteil jedes Datenobjektes. Sie gliedern sich in Eigenschaften mit vorgegebenem Vokabular und ihnen zugewiesenen Werten/Inhalten. 
Für mehr siehe 2.1.4 oder auch [Help:Aussagen](https://www.wikidata.org/w/index.php?title=Help:Statements/de&oldid=108007039) 


# FAQ

1. Wo finde ich 
Enter text in [Markdown](http://daringfireball.net/projects/markdown/). Use the toolbar above, or click the **?** button for formatting help.

# Glossar {.unnumbered}

*Penflip kann derzeit noch keine Definitionslisten, das ist aber im Moment nebensächlich.*

Hier werden verschiedene *Fachbegriffe* in kurzen Abschnitten erläutert:

**Aussage**
  : ...
**Anderer Fachbegriff**
  : ...
**Eigenschaft**
  : ...
**Item**
 : ...
**Metadaten**
  : ...
**Normdaten**
  : ...
**Normdatei**
  : ...  
**Wikidata**
  : ...
**Wikidata-API**
  : Schnittstelle, über die Wikidata per Programm abgefragt und bearbeitet werden kann.
  
  
  
  


# Literaturverzeichnis {.unnumbered}

## Allgemeines {.unnumbered}

1. Monografien
* Beispiel1
* Beispiel2
* Beispiel3
* Beispiel4

2. Internetadressen
* Beispiel1
* Beispiel2
* Beispiel3
* Beispiel4

## Weiterführende Literatur {.unnumbered}

* Beispiel1

* Beispiel2

* Beispiel3




# Über dieses Handbuch {.unnumbered}

Dieses Handbuch entstand im Rahmen eines Projektseminars im Bachelor-Studiengang Informationsmanagement an der Hochschule Hannover (HsH). Zur Verwaltung der Inhalte wurde ein Repository des Versionskontrollsystem *git* verwendet, das alle Bearbeitungsschritte und Änderungen beinhaltet. Auf diese Weise kann mit verschiedenen Plattformen und Werkzeugen zum Inhalt des Buches beigetragen werden, ohne zu stark an eine Software gebunden zu sein. Im Folgenden sind zunächst die Struktur des Handbuch-Repositories und anschließend die verwendeten Werkzeuge beschrieben.

## Struktur des Handbuch-Repository {.unnumbered}

* Die eigentlichen Inhalte befinden sich in [Markdown-Syntax](#verwendete-markdown-syntax) in Dateien mit der Endung `.txt`.

* In der der Datei `Contents.txt` ist festgelegt, welche Markdown-Dateien in welcher Reihenfolge letztendlich das Handbuch bilden. Pro Zeile ist ein Dateiname angegeben; Leerzeilen und Zeilen, die mit `>` beginnen, werden ignoriert.

* Das Verzeichnis `images/` enthält Bilder.

* Das Verzeichnis `layout/` enthält Template- und Stylesheet-Dateien.

* Die Dateien `About.txt` und `README.md` enthalten kurze Projektbeschreibungen, die nicht im Handbuch auftauchen.

* Die Datei `Makefile` enthält Anweisungen, um aus den Inhaltsdateien das Handbuch in verschiedenen Ausgabeformaten zu erzeugen.

## Verwendete Markdown-Syntax {.unnumbered}

Die Texte sind in Markdown-Syntax verfasst, wobei sich die konkrete Markdown-Variante aus Anforderungen von *Penflip* und *Pandoc* ergibt. Eine Übersicht dieser beiden Markdown-Varianten gibt es unter:

* <https://www.penflip.com/Penflip/help/blob/master/Markdown.txt> für Penflip
* <http://johnmacfarlane.net/pandoc/demo/example9/pandocs-markdown.html> für Pandoc

## Verwendete Werkzeuge {.unnumbered}

* <http://penflip.com>
* <http://johnmacfarlane.net/pandoc/>
* <http://github.com>


