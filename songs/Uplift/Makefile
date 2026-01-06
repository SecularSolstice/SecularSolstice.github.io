PREFIX=Uplift-
FILES_TO_LIST=lyrics.txt chord-chart.html
ALTERNATE_VERSIONS=toolsdrones

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 6

gen/${PREFIX}toolsdrones--lyrics.txt: toolsdrones--chart.csv
	../../scripts/csv-to-lyrics.py toolsdrones--chart.csv gen/${PREFIX}toolsdrones--lyrics.txt 6


include ../Makefile.common
