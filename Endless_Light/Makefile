PREFIX=Endless_Light-

gen/${PREFIX}lyrics.txt: chart.csv
	../scripts/csv-to-lyrics.py chart.csv - 6 | sed 's/  */ /g' > gen/${PREFIX}lyrics.txt

include ../scripts/Makefile.common
