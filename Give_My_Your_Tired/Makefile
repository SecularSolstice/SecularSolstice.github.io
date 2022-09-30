PREFIX=Give_My_Your_Tired-
FILES_TO_LIST=lyrics.txt chord-chart.html

gen/${PREFIX}lyrics.txt: chart.csv
	mkdir -p gen
	../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 5

include ../scripts/Makefile.common
