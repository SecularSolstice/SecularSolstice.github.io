gen/%.html: %.md 
	cat head.html > $@
	head -n 1 $< | tr -d '#' >> $@
	echo '</title></head><body>' >> $@
	pandoc -f markdown $< >> $@
	echo '</body></html>' >> $@

ALLH=$(patsubst %.md, gen/%.html, $(wildcard *.md))
all: ${ALLH}

