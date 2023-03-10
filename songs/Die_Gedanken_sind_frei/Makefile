PREFIX=Die_Gedanken_sind_frei-
FILES_TO_LIST=lyrics.txt sheet-music.pdf sheet-music-english.pdf 

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt

gen/${PREFIX}sheet-music-english.pdf: sheet-music.ly
	lilypond -denglish -o gen/${PREFIX}sheet-music-english sheet-music.ly

include ../Makefile.common
