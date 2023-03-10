PREFIX=When_I_Die-
FILES_TO_LIST=lyrics.txt chord-chart.html

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv - 5 | grep -v 'partial measure' > gen/${PREFIX}lyrics.txt

include ../Makefile.common
