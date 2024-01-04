LISTS=$(patsubst %.lst, gen/%.html, $(wildcard *.lst))

gen/%.html: %.lst ../scripts/process_list.py $(wildcard ../*/*.md) $(wildcard ../songs/*/*lyrics.txt)
	../scripts/process_list.py $<

all: ${LISTS}
	echo done making lists

clean:
	rm -f gen/*
