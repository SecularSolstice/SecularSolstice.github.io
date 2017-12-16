PREFIX=Gather_Round-

gen/${PREFIX}lyrics.txt: chart.csv
	../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 6

include ../scripts/Makefile.common
