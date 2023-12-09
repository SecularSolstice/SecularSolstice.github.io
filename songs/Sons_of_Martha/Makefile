PREFIX=Sons_of_Martha-
FILES_TO_LIST=lyrics.txt from-midi.mp3 sheet-music.pdf sheet-music-legal.pdf

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt

gen/${PREFIX}sheet-music-ina.pdf: sheet-music.ly
	lilypond -dkey=a -o gen/${PREFIX}sheet-music-ina sheet-music.ly
	rm gen/${PREFIX}sheet-music-ina.midi

gen/${PREFIX}sheet-music-inf.pdf: sheet-music.ly
	lilypond -dkey=f -o gen/${PREFIX}sheet-music-inf sheet-music.ly
	rm gen/${PREFIX}sheet-music-inf.midi

gen/${PREFIX}sheet-music-threestaff.pdf: sheet-music.ly
	lilypond -dthreestaff -o gen/${PREFIX}sheet-music-threestaff sheet-music.ly
	rm gen/${PREFIX}sheet-music-threestaff.midi

gen/${PREFIX}sheet-music-ina-threestaff.pdf: sheet-music.ly
	lilypond -dthreestaff -dkey=a -o gen/${PREFIX}sheet-music-ina-threestaff sheet-music.ly
	rm gen/${PREFIX}sheet-music-ina-threestaff.midi

gen/${PREFIX}sheet-music-inf-threestaff.pdf: sheet-music.ly
	lilypond -dthreestaff -dkey=f -o gen/${PREFIX}sheet-music-inf-threestaff sheet-music.ly
	rm gen/${PREFIX}sheet-music-inf-threestaff.midi


gen/${PREFIX}sheet-music-justvoice.pdf: sheet-music.ly
	lilypond -djustvoice -o gen/${PREFIX}sheet-music-justvoice sheet-music.ly
	rm gen/${PREFIX}sheet-music-justvoice.midi

gen/${PREFIX}sheet-music-ina-justvoice.pdf: sheet-music.ly
	lilypond -djustvoice -dkey=a -o gen/${PREFIX}sheet-music-ina-justvoice sheet-music.ly
	rm gen/${PREFIX}sheet-music-ina-justvoice.midi

gen/${PREFIX}sheet-music-inf-justvoice.pdf: sheet-music.ly
	lilypond -djustvoice -dkey=f -o gen/${PREFIX}sheet-music-inf-justvoice sheet-music.ly
	rm gen/${PREFIX}sheet-music-inf-justvoice.midi

include ../Makefile.common
