#!/bin/bash

TITLE="$(basename $(pwd) | tr '_' ' ')"

cat <<EOF
<html>
  <head>
    <title>Secular Solstice Resources</title>
    <link rel=stylesheet href=theme.css>
  </head>
  <body>
    <h1>Secular Solstice Resources</h1>
EOF

for i in lists/gen/*.html misc/gen/*.html; do
         if [ "$i" != "index.html" ] && ! echo "$i" | grep tentative > /dev/null; then
             echo "<h2><a href=$i>"
             echo "$i" | sed 's@.*/gen/@@' | sed 's/.html//' | tr '_' ' '
             echo "</a></h2>"
         fi
done

echo "<a class=rawgit href=https://github.com/SecularSolstice/SecularSolstice.github.io>Raw Git</a>"

echo "</body></html>"
