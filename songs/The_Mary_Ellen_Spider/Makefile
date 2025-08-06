PREFIX=The_Mary_Ellen_Spider-

FILES_TO_LIST=lyrics.txt

gen/${PREFIX}lyrics.txt: chords.jkc
	grep -v '^ ' chords.jkc > gen/lyrics.txt
include ../Makefile.common
