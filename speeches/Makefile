gen/%.html: %.md head.html
	( cat head.html ; pandoc -f markdown $< ; echo "<a href=https://github.com/SecularSolstice/SecularSolstice.github.io/edit/master/speeches/$< class=editbutton>edit</a>"; echo '</body></html>' ) > $@

ALLH=$(patsubst %.md, gen/%.html, $(wildcard *.md))
all: ${ALLH}
	echo done

