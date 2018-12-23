PREFIX=Somewhere_to_Begin-
FILES_TO_LIST=chord-sheet.pdf chord-sheet-2col.pdf lyrics.txt

gen/${PREFIX}lyrics.txt: chord-sheet.chordpro
	../scripts/chordpro-to-lyrics.sh  chord-sheet.chordpro > gen/${PREFIX}lyrics.txt

include ../scripts/Makefile.common
