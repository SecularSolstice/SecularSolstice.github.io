#!/bin/bash

set -ex
cd $(dirname $0)/..


# Source https://stackoverflow.com/questions/21735435/git-clone-changes-file-modification-time/55609950#55609950

git ls-tree -r --name-only HEAD | while read filename; do
  unixtime=$(git log -1 --format="%at" -- "${filename}")
  touchtime=$(date -d @$unixtime +'%Y%m%d%H%M.%S')
  touch -t ${touchtime} "${filename}"
done
