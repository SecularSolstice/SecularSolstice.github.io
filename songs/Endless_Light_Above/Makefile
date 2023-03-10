PREFIX=Endless_Light-Above-
FILES_TO_LIST=lyrics.txt chord-chart.html

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv - 6 | sed 's/  */ /g' > gen/${PREFIX}lyrics.txt

include ../Makefile.common
