PREFIX=The_Sun_Is_Medley-
FILES_TO_LIST=lyrics.txt chord-sheet.pdf 

gen/${PREFIX}lyrics.txt: chord-sheet.cho
	../../scripts/chordpro-to-lyrics.sh chord-sheet.cho > gen/${PREFIX}lyrics.txt

include ../Makefile.common
