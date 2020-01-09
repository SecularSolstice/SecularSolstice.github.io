#!/bin/bash

cd $(dirname $0)/..

echo "Songs:"
# Omit stub songs
SONGS=$(ls */gen/*-lyrics.txt | sed 's@/gen/.*-lyrics.txt@@')
for i in $SONGS; do
    grep $i lists/All_Songs.lst >/dev/null || echo $i
done

echo
echo "Speeches:"
SPEECHES=$(ls speeches/*.md | sed 's@speeches/@@' | sed 's/.md$//')
for i in $SPEECHES; do
    grep $i lists/All_Speeches.lst >/dev/null || grep $i lists/All_Activities.lst >/dev/null || echo $i
done

