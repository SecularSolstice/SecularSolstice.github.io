PREFIX=I_Have_Seen_the_Tops_of_Clouds-
FILES_TO_LIST=lyrics.txt sheet-music.pdf sheet-music-allnotations.pdf sheet-music-chord-sheet.pdf from-midi.mp3

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt verse_b,finale

gen/${PREFIX}sheet-music-allnotations.pdf: sheet-music.ly
	lilypond -dallnotations -o gen/${PREFIX}sheet-music-allnotations sheet-music.ly
	rm gen/${PREFIX}sheet-music-allnotations.midi

gen/${PREFIX}sheet-music-chord-sheet.pdf: sheet-music.ly
	lilypond -dchordsheet -o gen/${PREFIX}sheet-music-chord-sheet sheet-music.ly
	rm gen/${PREFIX}sheet-music-chord-sheet.midi

include ../scripts/Makefile.common
