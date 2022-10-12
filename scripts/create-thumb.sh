#!/usr/bin/env bash

set -euxo pipefail

export OUTPUT="$1"
export BASE=$(dirname $1)

# Try to make sheet music / chord chart
make "$BASE/sheet-music.pdf" 2>/dev/null || true
make "$BASE/chord-chart.html" 2>/dev/null || true

if [ -e "$BASE/sheet-music.pdf" ]; then 
    convert -density 70 -negate -crop 600x315 \
            $BASE/sheet-music.pdf $OUTPUT
    mv $BASE/thumb-0.png $OUTPUT
    rm $BASE/thumb-*.png
    composite $OUTPUT ./dawn-small-dark.jpg $OUTPUT
# elif [ -e "$BASE/chord-chart.html" ]; then 
#     export CSS="td { white-space: normal; font-weight: bold }"
#     export TMP="$BASE/tmp${RANDOM}.html"
#     cat "$BASE/chord-chart.html" |
#         sed 's/Chord Chart//' |
#         sed "s@</head>@<style>${CSS}</style></head>@" > $TMP
#     wkhtmltoimage --height 315 --width 600 --disable-smart-width \
#                   --enable-local-file-access $TMP $OUTPUT
#     rm $TMP
else
    mkdir -p $BASE
    convert \
        -crop 1200x630+0+120 \
        -geometry 600x400 \
        -annotate +0-50 "$(grep '^# ' $(dirname $BASE)/README.md | sed 's/# //')" \
        -gravity center -pointsize 32 -fill yellow  \
        ./dawn-bkg.jpg $OUTPUT
fi
