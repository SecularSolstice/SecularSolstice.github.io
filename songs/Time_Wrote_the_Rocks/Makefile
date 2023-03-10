PREFIX=Time_Wrote_the_Rocks-
FILES_TO_LIST=lyrics.txt chord-chart.html

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 7

include ../Makefile.common
