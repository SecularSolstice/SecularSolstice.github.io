PREFIX=Winter_Is_Icumen_In-
FILES_TO_LIST=lyrics.txt sheet-music.pdf sheet-music-modern.pdf from-midi.mp3

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt

gen/${PREFIX}sheet-music-modern.pdf: sheet-music.ly
	lilypond -dmodern -o gen/${PREFIX}sheet-music-modern sheet-music.ly
	rm gen/${PREFIX}sheet-music-modern.midi


include ../Makefile.common
