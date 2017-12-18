#!/bin/bash

TITLE="$(basename $(pwd) | tr '_' ' ')"

cat <<EOF
<html>
  <head>
    <title>Secular Solstice Resources</title>
    <link rel=stylesheet href=theme.css>
  </head>
  <body>
    <h1>Secular Solstice</h1>
EOF

for i in lists/gen/*.html *.html; do
         if [ "$i" != "index.html" ]; then
             echo "<h2><a href=$i>"
             echo "$i" | sed 's@lists/gen/@@' | sed 's/.html//' | tr '_' ' '
             echo "</a></h2>"
         fi
done

echo "</body></html>"
