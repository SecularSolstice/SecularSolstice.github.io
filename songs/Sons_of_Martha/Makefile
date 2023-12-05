PREFIX=Sons_of_Martha-
FILES_TO_LIST=lyrics.txt sheet-music.pdf from-midi.mp3 sheet-music-ina.pdf sheet-music-inf.pdf

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt

gen/${PREFIX}sheet-music-ina.pdf: sheet-music.ly
	lilypond -dkey=a -o gen/${PREFIX}sheet-music-ina sheet-music.ly
	rm gen/${PREFIX}sheet-music-ina.midi

gen/${PREFIX}sheet-music-inf.pdf: sheet-music.ly
	lilypond -dkey=f -o gen/${PREFIX}sheet-music-inf sheet-music.ly
	rm gen/${PREFIX}sheet-music-inf.midi

include ../Makefile.common
