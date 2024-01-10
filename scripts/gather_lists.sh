#!/usr/bin/env bash

set -ex

cd $(dirname $0)/..

echo 'content = {'

for i in  songs/*/README.md; do
    echo
    echo "  '$i': [" | sed 's@/README.md@@' | sed 's@songs/@@'
    grep '#' $i | head -n 3 | sed 's/"/\\"/g' | sed 's/^#* */    "/' | sed 's/$/",/'
    echo '  ],'
done

for i in  speeches/*.md; do
    echo
    echo "  '$i': [" | sed 's@speeches/@@' | sed 's/.md//'
    grep '#' $i | head -n 2 | sed 's/^#* */    "/' | sed 's/$/",/'
    echo '    "[speech]",'
    echo '  ],'
done
echo '};'

echo
echo

LISTS=$(ls lists/*.list | grep -v All_)
echo 'sections = ['
grep -h '^#' $LISTS | sed 's/^# */  "/' | sed $'s/[ \t]*$/",/' | sort | uniq
echo '];'

echo

echo 'programs = ['
echo $LISTS | sed 's@\.list@",@g' | sed 's@lists/@ "@g'
echo '];'

echo

echo 'taglines = {'
for LIST in $LISTS; do
    BN=$(basename $LIST)
    TL=$(grep '{' $LIST)  && echo "  ${BN/.list/}: '$TL',"
done
echo '}'

echo

echo "recordings = {"
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
