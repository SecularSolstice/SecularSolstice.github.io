PREFIX=Son_of_Man-
FILES_TO_LIST=lyrics.txt chord-sheet.cho chord-sheet.pdf chord-sheet-2col.pdf 

gen/${PREFIX}lyrics.txt: chord-sheet.ugc
	../../scripts/parse_ugc.py chord-sheet.ugc --lyrics > gen/${PREFIX}lyrics.txt
include ../Makefile.common
