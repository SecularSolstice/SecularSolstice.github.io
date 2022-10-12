# All the files that need to be generated
all: $(patsubst %,%/gen/index.html,$(wildcard songs/*))
	cd lists && make all
	cd misc && make all
	cd speeches && make all


# Rule for generating the index page of a song
.PRECIOUS: songs/%/gen/index.html
songs/%/gen/index.html: songs/%/README.md songs/%/gen/thumb.png scripts/create-index.sh
	cd $(dir $(@D)) && ../../scripts/create-index.sh > gen/index.html

.PRECIOUS: songs/%/gen/thumb.png
songs/%/gen/thumb.png:
	./scripts/create-thumb.sh $@


# Rules for generating lyrics
.PRECIOUS: songs/%/gen/lyrics.txt

songs/%/gen/lyrics.txt: songs/%/lyrics.txt
	mkdir -p $(@D)
	cp $^ $@

songs/%/gen/lyrics.txt: songs/%/chord-sheet.cho
	mkdir -p $(@D)
	./scripts/chordpro-to-lyrics.sh $^ > $@

songs/%/gen/lyrics.txt: songs/%/chord-sheet.ugc
	mkdir -p $(@D)
	./scripts/parse_ugc.py $^ --lyrics > $@

songs/%/gen/lyrics.txt: songs/%/sheet-music.ly
	./scripts/ly-to-lyrics.py $^ $@


# Rules for generating chord sheets
.PRECIOUS: songs/%/gen/chord-sheet.cho

songs/%/gen/chord-sheet.cho: songs/%/chord-sheet.ugc
	mkdir -p $(@D)
	./scripts/parse_ugc.py $^ --cp > $@

songs/%/gen/chord-sheet.cho: songs/%/chord-sheet.cho
	mkdir -p $(@D)
	cp $^ $@

.PRECIOUS: songs/%/gen/sheet-music.midi songs/%/gen/sheet-music.pdf

songs/%/gen/sheet-music.midi songs/%/gen/sheet-music.pdf: songs/%/sheet-music.ly
	mkdir -p $(@D)
	lilypond -o $(@D)/sheet-music $^

songs/%/gen/sheet-music.midi: songs/%/sheet-music.midi
	mkdir -p $(@D)
	cp $^ $@

.PRECIOUS: songs/%/gen/chord-sheet.pdf
songs/%/gen/chord-sheet.pdf: songs/%/gen/chord-sheet.cho
	mkdir -p $(@D)
	cat $^ | chordpro --output $@ -

.PRECIOUS: songs/%/gen/chord-sheet-2col.pdf
songs/%/gen/chord-sheet-2col.pdf: songs/%/gen/chord-sheet.cho
	mkdir -p $(@D)
	( echo '{columns:2}' ; cat $^ ) | chordpro --output $@ -

.PRECIOUS: songs/%/gen/chord-chart.html
songs/%/gen/chord-chart.html: songs/%/chart.csv
	mkdir -p $(@D)
	./scripts/csv-to-html.py $^ $@


# Ruless for generating audio files
songs/%/gen/from-midi.wav: songs/%/gen/sheet-music.midi
	mkdir -p $(@D)
	timidity $^ -Ow -o $@

.PRECIOUS: songs/%/gen/from-midi.mp3
songs/%/gen/from-midi.mp3: songs/%/gen/from-midi.wav
	mkdir -p $(@D)
	lame $^ $@


# Dependencies
include Makefile.dep


# Disable implicit rules (for a better debug output)
.SUFFIXES:
MAKEFLAGS += --no-builtin-rules


# Song-specific rules
include Makefile.specific


# Utils
.PHONY: broken-links
broken-links:
	-wget --spider -r -nd -nv -l 10 -o run1.log  http://localhost:4000
	-grep --color -B1 'broken link!' run1.log
	rm run1.log
