PREFIX=Bring_the_Light_Reprise-
FILES_TO_LIST=sheet-music.pdf chord-chart.html lyrics.txt from-midi.mp3

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 4

include ../Makefile.common
