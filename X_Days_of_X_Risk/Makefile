PREFIX=X_Days_of_X_Risk-

gen/${PREFIX}lyrics.txt: chart.csv
	../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 5

include ../scripts/Makefile.common
