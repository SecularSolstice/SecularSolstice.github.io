PREFIX=Beyond_All_Towers-
FILES_TO_LIST=lyrics.txt sheet-music.pdf from-midi.mp3 sheet-music-raise.pdf

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt

gen/${PREFIX}sheet-music-raise.pdf: sheet-music.ly
	lilypond -draise -o gen/${PREFIX}sheet-music-raise sheet-music.ly
	rm gen/${PREFIX}sheet-music-raise.midi


include ../Makefile.common
