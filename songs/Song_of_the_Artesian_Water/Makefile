PREFIX=Song_of_the_Artesian_Water-
FILES_TO_LIST=lyrics.txt chord-sheet.cho chord-sheet.pdf 

gen/${PREFIX}lyrics.txt: chord-sheet.ugc
	../../scripts/parse_ugc.py chord-sheet.ugc --lyrics > gen/${PREFIX}lyrics.txt
include ../Makefile.common
