#!/usr/bin/env bash

set -ex

cd $(dirname $0)/..

echo 'const content = {'

for i in  songs/*/README.md; do
    echo
    echo "  '$i': [" | sed 's@/README.md@@' | sed 's@songs/@@'
    grep '#' $i | head -n 3 | sed 's/"/\\"/g' | sed 's/^#* */    "/' | sed 's/$/",/' | tr -d '\r'
    echo '  ],'
done

for i in  speeches/*.md; do
    echo
    echo "  '$i': [" | sed 's@speeches/@@' | sed 's/.md//'
    grep '#' $i | head -n 2 | sed 's/^#* */    "/' | sed 's/$/",/' | tr -d '\r'
    echo '    "[speech]",'
    echo '  ],'
done
echo '};'

echo "for (let k in content) {"
echo "  let v = content[k];"
echo "  if (v.length==2) v.push(v[1])"
echo "}"

echo
echo

echo "const variants = {"
for SONG in songs/*; do
    pushd $SONG >/dev/null || continue
    eval $(grep PREFIX= Makefile )
    V1=$(ls gen/${PREFIX}*--* | sed "s@gen/${PREFIX}@@" | sed 's/--.*//' | sort | uniq)
    V2=$(ls *--* | sed 's/--.*//' | sort | uniq)
    VARIANTS=$( (echo $V1; echo $V2) | sort | uniq)
    if [[ -n "$VARIANTS" ]]; then
        echo -n "  '$SONG': [" | sed 's@songs/@@'
        echo "$VARIANTS" | sed 's/^/"/' | sed 's/$/"/' | tr '\n' ','
        echo " ],"
    fi
    popd >/dev/null
done
echo "};"

LISTS=$(ls lists/*.list | grep -v All_)
echo 'const sections = ['
grep -h '^#' $LISTS | sed 's/^# */  "/' | sed $'s/[ \t]*$/",/' | sort | uniq
echo '];'

echo

echo 'const programs = ['
echo $LISTS | sed 's@\.list@",@g' | sed 's@lists/@ "@g'
echo '];'

echo

echo 'const taglines = {'
for LIST in $LISTS; do
    BN=$(basename $LIST)
    TL=$(grep '{' $LIST)  && echo "  ${BN/.list/}: '$TL',"
done
echo '}'

echo

echo "const recordings = {"
pushd songs >/dev/null
for i in *; do
    pushd $i >/dev/null || continue
    RECORDING=$(ls gen/*.mp3 *.mp3 *.m4a 2>/dev/null | tail -n 1)
    if [[ "$RECORDING" != "" ]]; then
	echo "  '$i': '$RECORDING',"
    fi
    popd >/dev/null
done
popd >/dev/null
echo "};"
