gen/%.html: %.md head.html
	( cat head.html ; pandoc -f markdown $< ; echo '</body></html>' ) > $@

ALLH=$(patsubst %.md, gen/%.html, $(wildcard *.md))
all: ${ALLH}
	echo done

