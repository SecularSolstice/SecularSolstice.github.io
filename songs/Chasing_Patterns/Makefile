PREFIX=Chasing_Patterns-
FILES_TO_LIST=lyrics.txt chord-chart.html sheet-music.pdf from-midi.mp3

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 6

include ../Makefile.common
