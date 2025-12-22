#!/usr/bin/env python

import sys,csv

inf = open(sys.argv[1])
outfn = sys.argv[2]
if outfn=='-':
    outf=sys.stdout
else:
    outf=open(outfn,'w')
col = int(sys.argv[3])

for line in csv.reader(inf):
    if len(line)<=col:
        outf.write('\n')
        continue
    chop=line[col:]
    s=' '.join(chop)
    if ' / ' in s:
        s=s.replace(' / ','\n')+'\n'
    outf.write(s+'\n')
outf.close()
