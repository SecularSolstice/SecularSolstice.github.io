#!/usr/bin/env bash

set -ex

cd $(dirname $0)/..

cat <<EOF
<html>
  <head>
    <title>Secular Solstice Resources</title>
    <link rel=stylesheet href=../../theme.css>
    <script src='../../theme-switcher.js'></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <style>
      a {
        text-decoration: none;
      }
      a h2 {
        text-decoration: underline;
      }
      a:hover {
        color: #7ff;
      }
      h3 {
        color: inherit;
        text-shadow: 0 0 0.5em black, 0 0 2em #003;
        font-size: 15pt;
        margin-bottom: 30px;
     }
     div.col {
        display: inline-block;
        width: 20em;
        vertical-align: text-top;
     }
    </style>
  </head>
  <body>
EOF

cat misc/header.html

echo "<h1>Programs</h1>"

echo "<center><div class=col>"
ISCOL2=""
for i in $(ls lists/gen/*.html | sort); do
    if [ "$i" != "index.html" ] &&
           ! echo "$i" | egrep 'tentative|options|slides|All_' > /dev/null; then
        if echo "$i" | grep '^lists/gen/[N-Zn-z]' > /dev/null && [ -z "$ISCOL2" ]; then
            echo "</div><div class=col>"
            ISCOL2="True"
        fi
        echo "<a href=../../$i><h2>"
        echo "$i" | sed 's@.*/gen/@@' | sed 's/.html//' | tr '_' ' '
        echo '</h2>'
        grep '<h3>' $i || true
        echo "</a>"
    fi
done
echo "</div></center>"

echo "<a class=rawgit href=https://github.com/SecularSolstice/SecularSolstice.github.io>Raw Git</a>"

echo "</body></html>"
