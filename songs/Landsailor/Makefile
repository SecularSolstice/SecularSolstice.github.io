PREFIX=Landsailor-
FILES_TO_LIST=lyrics.txt sheet_music.pdf from_midi.mp3 chord-sheet.cho chord-sheet.pdf chord-sheet-2col.pdf

gen/${PREFIX}lyrics.txt: sheet-music.mscx
	../../scripts/mscx-to-lyrics.py sheet-music.mscx > gen/${PREFIX}lyrics.txt

include ../Makefile.common
