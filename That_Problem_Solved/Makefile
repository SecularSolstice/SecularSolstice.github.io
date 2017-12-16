PREFIX=That_Problem_Solved-

gen/${PREFIX}lyrics.txt: chart.csv
	../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 5

gen/${PREFIX}sheet-music.pdf: sheet-music.ly
	lilypond -o gen/${PREFIX}sheet-music sheet-music.ly

gen/${PREFIX}sheet-music-compact.pdf: sheet-music.ly
	lilypond -dcompact -o gen/${PREFIX}sheet-music-compact sheet-music.ly
	rm gen/${PREFIX}sheet-music-compact.midi

include ../scripts/Makefile.common
