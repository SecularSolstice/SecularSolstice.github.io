PREFIX=Voicing-of-Fear-
FILES_TO_LIST=lyrics.txt sheet-music.pdf sheet-music-drop.pdf voice-part-drop.pdf  sheet-music-compact.pdf sheet-music-compact-drop.pdf from-midi.mp3

gen/${PREFIX}lyrics.txt: sheet-music.ly
	../scripts/ly-to-lyrics.py sheet-music.ly gen/${PREFIX}lyrics.txt

gen/${PREFIX}voice-part.pdf: sheet-music.ly
	lilypond -dhidepiano -dhidecello -o gen/${PREFIX}voice-part sheet-music.ly
	rm gen/${PREFIX}voice-part.midi

gen/${PREFIX}sheet-music-compact.pdf: sheet-music.ly
	lilypond -dhidecello -o gen/${PREFIX}sheet-music-compact sheet-music.ly
	rm gen/${PREFIX}sheet-music-compact.midi

gen/${PREFIX}voice-part-drop.pdf: sheet-music.ly
	lilypond -dhidepiano -dhidecello -ddrop -o gen/${PREFIX}voice-part-drop sheet-music.ly
	rm gen/${PREFIX}voice-part-drop.midi

gen/${PREFIX}sheet-music-compact-drop.pdf: sheet-music.ly
	lilypond -dhidecello -ddrop -o gen/${PREFIX}sheet-music-compact-drop sheet-music.ly
	rm gen/${PREFIX}sheet-music-compact-drop.midi

gen/${PREFIX}sheet-music-drop.pdf: sheet-music.ly
	lilypond -ddrop -o gen/${PREFIX}sheet-music-drop sheet-music.ly
	rm gen/${PREFIX}sheet-music-drop.midi


include ../scripts/Makefile.common
