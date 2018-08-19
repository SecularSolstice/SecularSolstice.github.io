#!/bin/bash 

TITLE="$(grep '^# ' README.md | head -n 1 | sed 's/# //g')"
if [ -z "$TITLE" ]; then 
    TITLE="$(basename $(pwd) | tr '_' ' ')"
fi

cat <<EOF
<html>
  <head>
    <title>$TITLE</title>
    <link rel=stylesheet href=../../theme.css>
EOF

if [ -e gen/thumb.png ]; then
    THUMB="https://secularsolstice.github.io/$(basename $(pwd))/gen/thumb.png"
    echo "    <meta property='og:image' content='${THUMB}' />"
    echo "    <meta name='twitter:image' content='${THUMB}' />"
fi
echo "    <meta property='og:title' content='${TITLE}' />"
DESC="$(cat README.md | 
           head -n 5 |
           tail -n 4 |
           tr -d "'#" |
           tr '\n' '%' |
           sed 's/% *%/%/g' |
           sed 's@%@ // @g')"
echo "    <meta property='og:description' content='${DESC}' />"


cat <<EOF 
  </head>
  <body> 
    <div class=header>
      <a href="/">Home</a>
      <a href="/lists/gen/All_Songs.html">Songs</a>
      <a href="/lists/gen/All_Speeches.html">Speeches</a>
      <a href="http://secularsolstice.com/blog/">Blog</a>
    </div>
EOF


echo '<div class=notes>'
pandoc -f markdown README.md
echo '</div>'

echo "<h2>Lyrics</h2><p class=lyrics>"

cat gen/*lyrics.txt 2>/dev/null |
    sed 's/&/\&amp;/g' |
    sed 's/</\&lt;/g' |    
    sed 's/>/\&gt;/g' |    
    tr '\n' '>' |          # So that we can use sed to mess with lines
    sed 's/ *>/>/g'  |     # Trailing spaces confuse what follows
    sed 's/>>>*/>>/g' |    # No more than one skipped line
    sed 's/^>*//' |        # No leading skipped lines
    sed 's/>$//' |         # No trailing skipped lines 
    tr '>' '\n' |          # Back to normal
    sed 's/^   /\&nbsp; \&nbsp; \&nbsp; /' |
    awk '{print $0 "<br>"}' 

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

echo "<a class=rawgit href=https://github.com/SecularSolstice/SecularSolstice.github.io/tree/master/$(basename $(pwd))>Raw Git Folder</a>"

echo "</body></html>"
