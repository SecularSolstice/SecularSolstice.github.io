PREFIX=O_Tannenbaum-
FILES_TO_LIST=lyrics.txt sheet-music.pdf from-midi.mp3

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt
include ../Makefile.common
