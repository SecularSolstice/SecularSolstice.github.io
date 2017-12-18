PREFIX=Voicing-of-Fear-
FILES_TO_LIST=lyrics.txt sheet-music.pdf voice-part.pdf from-midi.mp3

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt

gen/${PREFIX}voice-part.pdf: sheet-music.ly
	lilypond -dvoicepart -o gen/${PREFIX}voice-part sheet-music.ly
	rm gen/${PREFIX}voice-part.midi

include ../scripts/Makefile.common
