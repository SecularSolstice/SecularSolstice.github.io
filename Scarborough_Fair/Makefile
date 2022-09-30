PREFIX=Scarborough_Fair-
FILES_TO_LIST=lyrics.txt chord-sheet.cho chord-sheet.pdf 

gen/${PREFIX}lyrics.txt: chord-sheet.ugc
	mkdir -p gen
	../scripts/parse_ugc.py chord-sheet.ugc --lyrics > gen/${PREFIX}lyrics.txt

include ../scripts/Makefile.common
