PREFIX=Scarborough_Fair_Triumphant_Reprise-
FILES_TO_LIST=lyrics.txt countermelody-sheet-music.pdf

gen/${PREFIX}lyrics.txt: lyrics.txt
	cp lyrics.txt gen/${PREFIX}lyrics.txt

gen/${PREFIX}countermelody-sheet-music.pdf: countermelody.ly
	lilypond -o gen/${PREFIX}countermelody-sheet-music countermelody.ly

include ../Makefile.common
