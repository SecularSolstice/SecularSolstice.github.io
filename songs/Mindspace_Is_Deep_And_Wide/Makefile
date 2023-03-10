PREFIX=Mindspace_Deep_Wide-
FILES_TO_LIST=lyrics.txt sheet-music.pdf

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt

include ../Makefile.common
