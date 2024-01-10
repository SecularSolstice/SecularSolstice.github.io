LISTS=$(patsubst %.list, gen/%.html, $(wildcard *.list))

gen/%.html: %.list ../scripts/process_list.py $(wildcard ../*/*.md)
	../scripts/process_list.py $<

all: ${LISTS}
	echo done making lists

clean:
	rm -f gen/*
