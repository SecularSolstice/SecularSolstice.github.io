PREFIX=Endless_Light_Around-
FILES_TO_LIST=lyrics.txt chord-chart.html motif.pdf ending-melody.pdf both-snippets.pdf

gen/${PREFIX}lyrics.txt: chart.csv
	../../scripts/csv-to-lyrics.py chart.csv - 6 | sed 's/  */ /g' > gen/${PREFIX}lyrics.txt

gen/${PREFIX}motif.pdf: motif.ly
	lilypond -o gen/${PREFIX}motif motif.ly

gen/${PREFIX}ending-melody.pdf: ending-melody.ly
	lilypond -o gen/${PREFIX}ending-melody ending-melody.ly

gen/${PREFIX}both-snippets.pdf: gen/${PREFIX}ending-melody.pdf gen/${PREFIX}motif.pdf
	pdfjam --outfile gen/${PREFIX}both-snippets.pdf --nup 1x2 gen/${PREFIX}motif.pdf gen/${PREFIX}ending-melody.pdf

include ../Makefile.common
