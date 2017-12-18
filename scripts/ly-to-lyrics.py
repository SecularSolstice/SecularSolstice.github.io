#!/usr/bin/python

import sys

inf = file(sys.argv[1])
outfn = sys.argv[2]
outf = (outfn=='-') and sys.stdout or file(outfn,'w')

inlyrics=False
for line in inf:
    if '\\lyricmode' in line:
        inlyrics=True
    elif '}' in line:
        inlyrics=False
    elif inlyrics:
        outf.write(line.replace(' -- ','').replace('"',''))
outf.close()
