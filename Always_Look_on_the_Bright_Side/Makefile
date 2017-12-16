PREFIX=Always_Look_on_the_Bright_Side-
FILES_TO_LIST=lyrics.txt chord-chart.html

gen/${PREFIX}lyrics.txt: chart.csv
	../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 6

include ../scripts/Makefile.common
