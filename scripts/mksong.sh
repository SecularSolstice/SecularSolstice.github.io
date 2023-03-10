#!/usr/bin/env bash

set -ex

cd $(dirname $0)/../songs

NAME="$1"
TYPE="$2"

mkdir $NAME
mkdir $NAME/gen
test -e $NAME/README.md ||
    echo '# ' $NAME | tr '_' ' ' | sed 's/.*/\L&/; s/[a-z]*/\u&/g' > $NAME/README.md

echo "PREFIX=${NAME}-" > $NAME/Makefile


case $TYPE in

    text)
        cat >>$NAME/Makefile <<EOF
FILES_TO_LIST=lyrics.txt

gen/\${PREFIX}lyrics.txt: lyrics.txt
	cp lyrics.txt gen/\${PREFIX}lyrics.txt
EOF
        touch $NAME/lyrics.txt
        ;;
    

    stub)
        cat >>$NAME/Makefile <<EOF
FILES_TO_LIST=

EOF
        ;;
    

    ugc)
        cat >>$NAME/Makefile <<EOF
FILES_TO_LIST=lyrics.txt chord-sheet.cho chord-sheet.pdf 

gen/\${PREFIX}lyrics.txt: chord-sheet.ugc
	../scripts/parse_ugc.py chord-sheet.ugc --lyrics > gen/\${PREFIX}lyrics.txt
EOF
        touch $NAME/chord-sheet.ugc
        ;;
    
    cho)
        cat >>$NAME/Makefile <<EOF
FILES_TO_LIST=chord-sheet.pdf chord-sheet-2col.pdf lyrics.txt

gen/\${PREFIX}lyrics.txt: chord-sheet.cho
	../scripts/chordpro-to-lyrics.sh chord-sheet.cho > gen/\${PREFIX}lyrics.txt
EOF
        touch $NAME/chord-sheet.cho
        ;;


    ly)
        cat >>$NAME/Makefile <<EOF
FILES_TO_LIST=lyrics.txt sheet-music.pdf voice-part.pdf cello-part.pdf sheet-music-compact.pdf from-midi.mp3

gen/\${PREFIX}lyrics.txt: sheet-music.ly
	../scripts/ly-to-lyrics.py sheet-music.ly gen/\${PREFIX}lyrics.txt
EOF
        touch $NAME/sheet-music.ly
        ;;

    mscx)
        cat >>$NAME/Makefile <<EOF

FILES_TO_LIST=lyrics.txt sheet_music.pdf from_midi.mp3

gen/${PREFIX}lyrics.txt: sheet-music.mscx
	../scripts/mscx-to-lyrics.py sheet-music.mscx > gen/${PREFIX}lyrics.txt
EOF
        touch $NAME/sheet-music.mscx
        ;;
    *)
        echo "Unrecognized format '$TYPE', can be text, stub, ugc, cho, ly or mscx"
        ;;

esac

echo 'include ../Makefile.common' >>$NAME/Makefile

cd $NAME
shopt -s extglob
test -e /tmp/emacs1000/server && emacsclient *.@(md|ugc|cho|txt)
make all
git add * gen/*
cd ..

