PREFIX=Bold_Orion-
FILES_TO_LIST=chord-chart.html lyrics.txt

gen/${PREFIX}chord-chart.html: chart.md
	cat ../speeches/head.html | sed 's/Speech/Bold Orion/' > gen/${PREFIX}chord-chart.html
	echo '<style> p { white-space: pre-line; } </style>' >> gen/${PREFIX}chord-chart.html
	pandoc -f markdown --wrap=preserve chart.md >> gen/${PREFIX}chord-chart.html
	echo '</body></html>' >> gen/${PREFIX}chord-chart.html

gen/${PREFIX}lyrics.txt: chart.md
	cat chart.md | grep -v ' [B-G] ' | grep -v '#' > gen/${PREFIX}lyrics.txt

include ../scripts/Makefile.common
