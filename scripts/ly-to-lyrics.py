#!/usr/bin/python

import sys

inf = file(sys.argv[1])
outfn = sys.argv[2]
outf = (outfn=='-') and sys.stdout or file(outfn,'w')
if len(sys.argv) > 3:
    chorus_before = set(sys.argv[3].split(','))
else:
    chorus_before = set()

chorus=''
is_chorus=False

inlyrics=False
for line in inf:
    if '\\lyricmode' in line:
        inlyrics=True
        is_chorus = ('chorus' in line)
        if line.split(' ')[0] in chorus_before:
            outf.write(chorus+'\n')
    elif '}' in line:
        if inlyrics:
            outf.write('\n')
        inlyrics=False
    elif inlyrics:
        txt = line.replace(' -- ','').replace('"','').replace(' _','')
        if is_chorus and txt.strip():
            txt = '    '+txt
            chorus += txt
        outf.write(txt)
outf.close()
