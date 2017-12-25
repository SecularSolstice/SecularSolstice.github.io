PREFIX=Bold_Orion-
FILES_TO_LIST=chords.html lyrics.txt

gen/${PREFIX}chords.html: chart.md
	cat ../speeches/head.html | sed 's/Speech/Bold Orion/' > gen/${PREFIX}chords.html
	echo '<style> p { white-space: pre-line; } </style>' >> gen/${PREFIX}chords.html
	pandoc -f markdown --wrap=preserve chart.md >> gen/${PREFIX}chords.html
	echo '</body></html>' >> gen/${PREFIX}chords.html

gen/${PREFIX}lyrics.txt: chart.md
	cat chart.md | grep -v ' [B-G] ' | grep -v '#' > gen/${PREFIX}lyrics.txt

include ../scripts/Makefile.common
