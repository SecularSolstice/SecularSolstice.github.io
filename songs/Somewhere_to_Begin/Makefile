PREFIX=Somewhere_to_Begin-
FILES_TO_LIST=chord-sheet.pdf chord-sheet-2col.pdf lyrics.txt

gen/${PREFIX}lyrics.txt: chord-sheet.cho
	../../scripts/chordpro-to-lyrics.sh chord-sheet.cho > gen/${PREFIX}lyrics.txt

include ../Makefile.common
