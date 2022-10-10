#!/usr/bin/env python

import sys,csv,os

inf = open(sys.argv[1])
outfn = sys.argv[2]
if outfn=='-':
    outf=sys.stdout
else:
    os.makedirs('gen', exist_ok=True)
    outf=open(outfn,'w')
col = int(sys.argv[3])

for line in csv.reader(inf):
    if len(line)<=col:
        continue
    chop=line[col:]
    s=' '.join(chop)
    if ' / ' in s:
        s=s.replace(' / ','\n')+'\n'
    outf.write(s+'\n')
outf.close()
