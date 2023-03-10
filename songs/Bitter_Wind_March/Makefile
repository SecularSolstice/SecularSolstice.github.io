PREFIX=Bitter_Wind_March-
FILES_TO_LIST=lyrics.txt chord-chart.html chord-sheet.pdf chord-sheet-2col.pdf

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv - 7 | sed 's/  */ /g' > gen/${PREFIX}lyrics.txt

include ../Makefile.common
