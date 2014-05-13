#.PHONY: reasonator.csv gadget.csv
	
default:
	make property-ids.csv
	make properties.csv

../properties.txt:
	catmandu convert CSV to Template --template `pwd`/table.tt --template_before `pwd`/../properties-einleitung.tt \
		< properties.csv > $@

# collect a sorted list of authority id properties
property-ids.csv: reasonator.csv gadget.csv
	awk -F, '{print$$1}' reasonator.csv gadget.csv \
		| sort -n | uniq | sed s/^/P/ > $@
	 
properties.csv: property-ids.csv properties.fix
	cat $< | catmandu convert Wikidata --fix properties.fix \
		to CSV --fields id,de,en,description > $@

# join with URL field from gadget.csv
p.csv:
	sed '1d;s/^P//' properties.csv | sort -k 1 -t , > ptmp.csv
	echo "id,de,en,desciption,label,url" > p.csv
	join -a 1 -t , -j 1 ptmp.csv gadget.csv >> p.csv
	rm ptmp.csv

# harvest authority id properties
reasonator.csv:
	./reasonator.pl | sort -k 1 -t , > $@
gadget.csv:
	./gadget.pl | sort -k 1 -t , > $@


