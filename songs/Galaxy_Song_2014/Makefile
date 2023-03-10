PREFIX=Galaxy_Song_2014-
FILES_TO_LIST=chord-sheet.pdf lyrics.txt

gen/${PREFIX}lyrics.txt: chord-sheet.cho
	../../scripts/chordpro-to-lyrics.sh chord-sheet.cho > gen/${PREFIX}lyrics.txt
include ../Makefile.common
