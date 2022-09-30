PREFIX=Endless_Light_Around-
FILES_TO_LIST=lyrics.txt chord-chart.html motif.pdf ending-melody.pdf both-snippets.pdf

gen/${PREFIX}lyrics.txt: chart.csv
	../scripts/csv-to-lyrics.py chart.csv - 6 | sed 's/  */ /g' > gen/${PREFIX}lyrics.txt

gen/${PREFIX}motif.pdf: motif.ly
	lilypond -o gen/${PREFIX}motif motif.ly

gen/${PREFIX}ending-melody.pdf: ending-melody.ly
	lilypond -o gen/${PREFIX}ending-melody ending-melody.ly

gen/${PREFIX}both-snippets.pdf: gen/${PREFIX}ending-melody.pdf gen/${PREFIX}motif.pdf
	pdfjam --angle 90 gen/${PREFIX}ending-melody.pdf --outfile ${PREFIX}ending-melody-rotated90.pdf
	pdfjam --angle 90 gen/${PREFIX}motif.pdf --outfile ${PREFIX}motif-rotated90.pdf
	pdfjam --nup 2x1 ${PREFIX}ending-melody-rotated90.pdf ${PREFIX}motif-rotated90.pdf --outfile ${PREFIX}motif-rotated90-nup.pdf
	pdfjam --angle 270 ${PREFIX}motif-rotated90-nup.pdf --outfile ${PREFIX}motif-rotated90-nup-rotated270.pdf
	mv ${PREFIX}motif-rotated90-nup-rotated270.pdf gen/${PREFIX}both-snippets.pdf
	rm *rotated*.pdf

include ../scripts/Makefile.common
