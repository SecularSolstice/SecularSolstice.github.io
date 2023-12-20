gen/%.html: %.md head.html
	( cat head.html | sed "s/<title>Speech/<title>$$(cat $< | head -1 | sed 's/# //')/" ; pandoc -f markdown $< ; echo "<a href=https://github.com/SecularSolstice/SecularSolstice.github.io/edit/master/speeches/$< class=editbutton>edit</a>"; echo '</body></html>' ) > $@

ALLH=$(patsubst %.md, gen/%.html, $(wildcard *.md))
all: ${ALLH}
	echo done making speeches

clean:
	rm -f gen/*

