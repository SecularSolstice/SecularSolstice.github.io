LISTS=$(patsubst %.lst, %.html, $(wildcard *.lst))

%.html: %.lst
	../scripts/process_list.py $<

all: ${LISTS}
