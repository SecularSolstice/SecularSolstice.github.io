PREFIX=Always_Look_on_the_Bright_Side-
FILES_TO_LIST=lyrics.txt

gen/${PREFIX}lyrics.txt: like-a-chord-chart.html
	cat like-a-chord-chart.html | grep -v '<' > gen/${PREFIX}lyrics.txt

include ../scripts/Makefile.common
