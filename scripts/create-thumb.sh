#!/bin/bash

export PREFIX="$1"

if [ -e "gen/${PREFIX}sheet-music.pdf" ]; then 
    convert -density 70 -negate -crop 600x600 \
            gen/${PREFIX}sheet-music.pdf gen/thumb.png 
    mv gen/thumb-0.png gen/thumb.png
    rm gen/thumb-*.png
    composite gen/thumb.png ../dawn-small-dark.jpg gen/thumb.png
elif [ -e "gen/${PREFIX}chord-chart.html" ]; then 
    export CSS="td{ white-space: normal; font-weight: bold; }"
    export TMP="gen/tmp${RANDOM}.html"
    cat gen/${PREFIX}chord-chart.html |
        sed 's/Chord Chart//' |
        sed "s@</head>@<style>${CSS}</style></head>@" > ${TMP}
    wkhtmltoimage --height 600  --width 600 --disable-smart-width \
                  ${TMP} gen/thumb.png
    rm ${TMP}
else
    convert \
        -geometry 600x450 \
        -annotate +0-100 "$(grep '^# ' README.md | sed 's/# //')" \
        -gravity center -pointsize 32 -fill yellow  \
        ../dawn-bkg.jpg  gen/thumb.png
fi
