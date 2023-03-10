PREFIX=Bring_the_Light-
FILES_TO_LIST=lyrics.txt chord-chart.html sheet-music.pdf

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 6

include ../Makefile.common
