PREFIX=Find_My_Tribe-
FILES_TO_LIST=lyrics.txt sheet-music-nyc2024.pdf nyc2024-from-midi.mp3  sheet_music-transcript.pdf transcript-from-midi.mp3

gen/${PREFIX}lyrics.txt: lyrics.txt
	cp lyrics.txt gen/${PREFIX}lyrics.txt

gen/${PREFIX}sheet-music-nyc2024.pdf: sheet-music-nyc2024.ly
	lilypond -o gen/${PREFIX}sheet-music-nyc2024 sheet-music-nyc2024.ly

gen/${PREFIX}sheet-music-nyc2024.midi: gen/${PREFIX}sheet-music-nyc2024.pdf
	test -e gen/${PREFIX}sheet-music-nyc2024.midi

gen/${PREFIX}nyc2024-from-midi.wav: gen/${PREFIX}sheet-music-nyc2024.midi
	timidity gen/${PREFIX}sheet-music-nyc2024.midi -Ow -o gen/${PREFIX}nyc2024-from-midi.wav

gen/${PREFIX}nyc2024-from-midi.mp3: gen/${PREFIX}nyc2024-from-midi.wav
	lame  gen/${PREFIX}nyc2024-from-midi.wav gen/${PREFIX}nyc2024-from-midi.mp3

gen/${PREFIX}sheet_music-transcript.pdf: sheet-music-transcript.mxl
	musescore -o gen/${PREFIX}sheet_music-transcript.pdf sheet-music-transcript.mxl

gen/${PREFIX}transcript-from-midi.mp3: sheet-music-transcript.mxl
	musescore -o gen/${PREFIX}transcript-from_midi.mp3 sheet-music-transcript.mxl



include ../Makefile.common
