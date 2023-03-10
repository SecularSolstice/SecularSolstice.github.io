PREFIX=Uplift-
FILES_TO_LIST=lyrics.txt chord-chart.html chord-chart-tools-drones.html

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv gen/${PREFIX}lyrics.txt 6

gen/${PREFIX}chord-chart-tools-drones.html: chart-tools-drones.csv
	../../scripts/csv-to-html.py chart-tools-drones.csv gen/${PREFIX}chord-chart-tools-drones.html


include ../Makefile.common
