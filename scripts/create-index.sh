#!/usr/bin/env bash 
set -ex

TITLE="$(grep '^# ' README.md | head -n 1 | sed 's/# //g')"
if [ -z "$TITLE" ]; then 
    TITLE="$(basename $(pwd) | tr '_' ' ')"
fi

cat <<EOF
<html>
  <head>
    <title>$TITLE</title>
    <meta charset="utf-8">
	<meta name="viewport" content="width=device-width initial-scale=1.0">
    <link rel=stylesheet href=../../../theme.css>
    <script src='../../../theme-switcher.js'></script>
EOF

if [ -e gen/thumb.png ]; then
    THUMB="https://secularsolstice.github.io/songs/$(basename $(pwd))/gen/thumb.png"
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


echo "  </head>  <body> "
cat $(dirname $0)/../misc/header.html

echo '<div class=notes>'
pandoc -f markdown README.md
echo "<p><a href=https://github.com/SecularSolstice/SecularSolstice.github.io/edit/master/songs/$(basename $PWD)/README.md class=editbutton>edit description</a></p>"
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
FILES=$( ls gen/*.pdf gen/*.midi gen/*.html gen/*.mp3 gen/*.txt gen/*.png gen/*.chordpro gen/*.cho 2>/dev/null |
               grep -v index |
               sed 's@gen/@@' |
               sort)
for f in $FILES; do
    echo "<li><a href=$f>$f</a>"
done
for f in *; do
    if     [ "$f" != "gen" ] &&
           [ "$f" != "Makefile" ] &&
           [ "$f" != "README.md" ] &&
           [[ "$f" =~ ^[^~]*$ ]]; then
        echo "<li><a href=../$f>$f</a>"
        if file $f | grep text > /dev/null; then
            echo "<a href=https://github.com/SecularSolstice/SecularSolstice.github.io/edit/master/songs/$(basename $PWD)/$f class=editbutton>edit</a>"
        fi
    fi
done

echo "</ul>"

echo "<a class=rawgit href=https://github.com/SecularSolstice/SecularSolstice.github.io/tree/master/songs/$(basename $(pwd))>Raw Git Folder</a>"

echo "</body></html>"
