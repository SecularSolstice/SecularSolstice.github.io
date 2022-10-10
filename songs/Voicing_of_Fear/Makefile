PREFIX=Voicing-of-Fear-
FILES_TO_LIST=lyrics.txt sheet-music.pdf voice-part.pdf cello-part.pdf sheet-music-compact.pdf from-midi.mp3

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt

gen/${PREFIX}voice-part.pdf: sheet-music.ly
	lilypond -dhidepiano -dhidecello -o gen/${PREFIX}voice-part sheet-music.ly
	rm gen/${PREFIX}voice-part.midi

gen/${PREFIX}cello-part.pdf: sheet-music.ly
	lilypond -dhidevoice -dhidepiano -o gen/${PREFIX}cello-part sheet-music.ly
	rm gen/${PREFIX}cello-part.midi

gen/${PREFIX}sheet-music-compact.pdf: sheet-music.ly
	lilypond -dhidecello -o gen/${PREFIX}sheet-music-compact sheet-music.ly
	rm gen/${PREFIX}sheet-music-compact.midi

include ../scripts/Makefile.common
