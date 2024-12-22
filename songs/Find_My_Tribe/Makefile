PREFIX=Find_My_Tribe-
FILES_TO_LIST=lyrics.txt sheet-music-dspeyer.pdf dspeyer-from-midi.mp3  sheet_music-transcript.pdf transcript-from-midi.mp3

gen/${PREFIX}lyrics.txt: lyrics.txt
	cp lyrics.txt gen/${PREFIX}lyrics.txt

gen/${PREFIX}sheet-music-dspeyer.pdf: sheet-music-dspeyer.ly
	lilypond -o gen/${PREFIX}sheet-music-dspeyer sheet-music-dspeyer.ly

gen/${PREFIX}sheet-music-dspeyer.midi: gen/${PREFIX}sheet-music-dspeyer.pdf
	test -e gen/${PREFIX}sheet-music-dspeyer.midi

gen/${PREFIX}dspeyer-from-midi.wav: gen/${PREFIX}sheet-music-dspeyer.midi
	timidity gen/${PREFIX}sheet-music-dspeyer.midi -Ow -o gen/${PREFIX}dspeyer-from-midi.wav

gen/${PREFIX}dspeyer-from-midi.mp3: gen/${PREFIX}dspeyer-from-midi.wav
	lame  gen/${PREFIX}dspeyer-from-midi.wav gen/${PREFIX}dspeyer-from-midi.mp3

gen/${PREFIX}sheet_music-transcript.pdf: sheet-music-transcript.mxl
	musescore -o gen/${PREFIX}sheet_music-transcript.pdf sheet-music-transcript.mxl

gen/${PREFIX}transcript-from-midi.mp3: sheet-music-transcript.mxl
	musescore -o gen/${PREFIX}transcript-from_midi.mp3 sheet-music-transcript.mxl



include ../Makefile.common
