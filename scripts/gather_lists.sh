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

LISTS=$(ls lists/*.lst | grep -v All_)
echo 'sections = ['
grep -h '^#' $LISTS | sed 's/^# */  "/' | sed $'s/[ \t]*$/",/' | sort | uniq
echo '];'
