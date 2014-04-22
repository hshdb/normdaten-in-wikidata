#!/bin/bash

PROPERTIES=`awk -v ORS=',' '{print $1}' authority-properties.csv`

FIX='copy_field("labels.de.value","x.name"); copy_field("id","x.id"); retain_field("x"); move_field("x.id","id"); move_field("x.name","name"); remove_field("x")'

catmandu convert Wikidata --ids "$PROPERTIES" --fix "$FIX" to JSON 

# TODO: just use template to convert to CSV (name, description, id)
#catmandu convert Wikidata --ids "$PROPERTIES" --fix "$FIX" to Template --template json2csv.tt

# TODO: see https://www.wikidata.org/wiki/MediaWiki:Gadget-AuthorityControl.js
# see also <http://meta.wikimedia.org/wiki/Reasonator/stringprops>
# TODO: get Wikidata, item, retain authority properties, create mapping / search for literature
# TODO: add literature link to each authority property in Wikidata
