PREFIX=I_Have_Seen_the_Tops_of_Clouds-
FILES_TO_LIST=lyrics.txt sheet-music.pdf sheet-music-drop.pdf sheet-music-high-gc.pdf from-midi.mp3

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt verse_b,finale

#gen/${PREFIX}sheet-music-allnotations.pdf: sheet-music.ly
#	lilypond -dallnotations -o gen/${PREFIX}sheet-music-allnotations sheet-music.ly
#	rm gen/${PREFIX}sheet-music-allnotations.midi

gen/${PREFIX}sheet-music-drop.pdf: sheet-music.ly
	lilypond -ddrop -o gen/${PREFIX}sheet-music-drop sheet-music.ly
	rm gen/${PREFIX}sheet-music-drop.midi

gen/${PREFIX}sheet-music-high-gc.pdf: sheet-music.ly
	lilypond -dguitarcello -o gen/${PREFIX}sheet-music-high-gc sheet-music.ly
	rm gen/${PREFIX}sheet-music-high-gc.midi

include ../Makefile.common
