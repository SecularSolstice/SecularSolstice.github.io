PREFIX=Bold_Orion-
FILES_TO_LIST=lyrics.txt chord-sheet.cho chord-sheet.pdf
ALTERNATE_VERSIONS=original

gen/${PREFIX}lyrics.txt: chord-sheet.ugc
	../../scripts/parse_ugc.py chord-sheet.ugc --lyrics > gen/${PREFIX}lyrics.txt

gen/${PREFIX}original--lyrics.txt: original--chord-sheet.ugc
	../../scripts/parse_ugc.py original--chord-sheet.ugc --lyrics > gen/${PREFIX}original--lyrics.txt

include ../Makefile.common
