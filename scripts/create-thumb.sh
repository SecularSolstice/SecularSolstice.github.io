#!/usr/bin/env bash

set -ex

export PREFIX="$1"

if ls gen/${PREFIX}*.pdf >/dev/null; then
    convert -density 70 -negate -crop 600x315 "${ANN[@]}" \
            $(ls gen/${PREFIX}*.pdf | head -n 1) gen/thumb.png 
    if ls gen/${PREFIX}*.pdf | head -n 1 | grep sheet.music >/dev/null; then
        mv gen/thumb-0.png gen/thumb.png
    else
        convert \
            -annotate +0+10 "$(grep '^# ' README.md | sed 's/# //')" \
            -gravity north -pointsize 32 -fill white  \
            gen/thumb-0.png gen/thumb.png
    fi
    rm gen/thumb-*.png
    composite gen/thumb.png $(dirname $0)/../dawn-small-dark.jpg gen/thumb.png
elif [ -e "gen/${PREFIX}chord-chart.html" ]; then 
    export CSS="td{ white-space: normal; font-weight: bold; }"
    export TMP="gen/tmp${RANDOM}.html"
    cat gen/${PREFIX}chord-chart.html |
        sed 's/Chord Chart//' |
        sed "s@</head>@<style>${CSS}</style></head>@" > ${TMP}
    wkhtmltoimage --height 315  --width 600 --disable-smart-width \
                  ${TMP} gen/thumb.png
    rm ${TMP}
else
    convert \
        -crop 1200x630+0+120 \
        -geometry 600x400 \
        -annotate +0-50 "$(grep '^# ' README.md | sed 's/# //')" \
        -gravity center -pointsize 32 -fill yellow  \
        $(dirname $0)/../dawn-bkg.jpg  gen/thumb.png
fi
