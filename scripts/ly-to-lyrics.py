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
finale=''
is_chorus=False
is_finale=False

last_black=False

inlyrics=False
for line in inf:
    # sys.stderr.write(repr([line,inlyrics,is_chorus])+'\n')
    if '\\lyricmode' in line:
        inlyrics=True
        is_chorus = (' chorus ' in line)
        is_finale = (' finale ' in line)
        if ((not chorus_before or line.split(' ')[0] in chorus_before) and
            not is_finale):
            outf.write('\n'+chorus+'\n')
    elif '}' in line:
        #if inlyrics:
        #    outf.write('\n')
        inlyrics=False
    elif inlyrics:
        txt = line.replace(' -- ','').replace('"','').replace(' _','')
        if is_chorus and txt.strip():
            txt = '    '+txt
            chorus += txt
        elif is_finale and txt.strip():
            finale += txt
        else:
            if not txt.strip():
                if last_blank:
                    continue
                last_blank=True
            else:
                last_blank=False
            outf.write(txt)

if finale:
    outf.write('\n'+chorus+'\n')
    outf.write(finale)
outf.close()
