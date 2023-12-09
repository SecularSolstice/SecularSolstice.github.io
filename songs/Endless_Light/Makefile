PREFIX=Endless_Light-
FILES_TO_LIST=lyrics.txt chord-chart.html chord-sheet.cho chord-sheet.pdf chord-sheet-2col-legal.pdf

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv - 6 | sed 's/  */ /g' > gen/${PREFIX}lyrics.txt

include ../Makefile.common
