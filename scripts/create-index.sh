#!/bin/bash 

TITLE="$(basename $(pwd) | tr '_' ' ')"

cat <<EOF
<html>
  <head>
    <title>$TITLE</title>
    <link rel=stylesheet href=../../theme.css>
EOF

if [ -e gen/thumb.png ]; then
    echo '<meta property="og:image" content="thumb.png" />'
    echo '<meta name="twitter:image" content="thumb.png" />'
fi

echo "  </head>  <body> "


pandoc -f markdown README.md

echo "<h2>Lyrics</h2><p>"

cat gen/*lyrics.txt 2>/dev/null |
    sed 's/&/\&amp;/g' |
    sed 's/</\&lt;/g' |    
    awk '{print $0 "<br>"}' |
    sed 's/^   /\&nbsp; \&nbsp; \&nbsp; /'

echo "</p>"

echo "<h2>Files</h2><ul>"
FILES=$( ls gen/*.pdf gen/*.midi gen/*.html gen/*.mp3 gen/*.txt gen/*.png 2>/dev/null |
               grep -v index |
               sed 's@gen/@@' |
               sort)
for f in $FILES; do
    echo "<li><a href=$f>$f</a>"
done
for f in *; do
    if     [ "$f" != "gen" ] &&
           [ "$f" != "Makefile" ] &&
           [ "$f" != "lyrics.txt" ] &&
           [ "$f" != "README.md" ] &&
           [[ "$f" =~ ^[^~]*$ ]]; then
        echo "<li><a href=../$f>$f</a>"
    fi
done

echo "</ul>"

echo "<a href=https://github.com/SecularSolstice/SecularSolstice.github.io/tree/master/$(basename $(pwd))>Raw Git Folder</a>"

echo "</body></html>"
