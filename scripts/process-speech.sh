TITLE=$(grep '^##' $1 | head -n 1 | tr '#' ' ')

cat <<EOF
<html>
  <head>
    <title>$TITLE</title>
    <link rel=stylesheet href=../../theme.css>
  </head>
  <body>
EOF

pandoc -f markdown $1

echo "</body></html>
