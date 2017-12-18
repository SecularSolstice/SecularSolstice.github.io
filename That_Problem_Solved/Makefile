PREFIX=That_Problem_Solved-
FILES_TO_LIST=lyrics.txt sheet-music.pdf sheet-music-compact.pdf chord-chart.html from-midi.mp3

gen/${PREFIX}lyrics.txt: chart.csv
	../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 5

gen/${PREFIX}sheet-music-compact.pdf: sheet-music.ly
	lilypond -dcompact -o gen/${PREFIX}sheet-music-compact sheet-music.ly
	rm gen/${PREFIX}sheet-music-compact.midi

include ../scripts/Makefile.common
