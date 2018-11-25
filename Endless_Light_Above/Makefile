PREFIX=Endless_Light-Above-
FILES_TO_LIST=lyrics.txt chord-chart.html motif.pdf

gen/${PREFIX}lyrics.txt: chart.csv
	../scripts/csv-to-lyrics.py chart.csv - 6 | sed 's/  */ /g' > gen/${PREFIX}lyrics.txt

gen/${PREFIX}motif.pdf: motif.ly
	lilypond -o gen/${PREFIX}motif.pdf motif.ly

include ../scripts/Makefile.common
