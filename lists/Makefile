LISTS=$(patsubst %.lst, gen/%.html, $(wildcard *.lst))

gen/%.html: %.lst
	../scripts/process_list.py $<

all: ${LISTS}
