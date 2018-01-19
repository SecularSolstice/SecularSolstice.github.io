gen/%.html: %.md head.html header.html
	cat head.html > $@
	head -n 1 $< | tr -d '#' >> $@
	echo '</title></head><body>' >> $@
	cat header.html >> $@
	pandoc -f markdown $< >> $@
	echo '</body></html>' >> $@

ALLH=$(patsubst %.md, gen/%.html, $(wildcard *.md))
all: ${ALLH}

