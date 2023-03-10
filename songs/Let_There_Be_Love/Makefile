PREFIX=Let_There_Be_Love-
FILES_TO_LIST=lyrics.txt sheet-music.pdf from-midi.mp3 sheet-music-nopiano.pdf

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt

gen/${PREFIX}sheet-music-nopiano.pdf: sheet-music.ly
	lilypond -dnopiano -o gen/${PREFIX}sheet-music-nopiano sheet-music.ly
	rm gen/${PREFIX}sheet-music-nopiano.midi

include ../Makefile.common
