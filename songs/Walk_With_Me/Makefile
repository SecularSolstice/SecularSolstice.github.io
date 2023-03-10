PREFIX=Walk_With_Me-
FILES_TO_LIST=lyrics.txt chord-chart.html sheet-music.pdf from-midi.mp3

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 5

include ../Makefile.common
