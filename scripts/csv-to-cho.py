#!/usr/bin/env python3

import sys,csv

inf = open(sys.argv[1])
outfn = sys.argv[2]
if outfn=='-':
    outf=sys.stdout
else:
    outf=open(outfn,'w')

data=list(csv.reader(inf))
for line in data:
    if line[0]:
        outf.write(f'\n{{comment: {line[0]} }}\n')
    x = 0
    for i in range(4):
        if i+8 >= len(line):
            outf.write(f'{{ {",".join(line)} }}\n')
            continue
        if len(line[i+1].strip()) == 0:
            continue
        for left in reversed(range(i+1)):
            if line[8+left]:
                break
        for right in range(left+1, len(line)-8):
            if line[8+right]:
                break
        t = int(len(line[8+left]) * float(i-left) / (right-left+1))
        wr = line[8+left][:t].rfind(' ')
        if wr!=-1 and t-wr<4:
            t=wr
        print(f'  "{line[1+i]}" {i} -> [{left}..{right}]({len(line[8+left])}) = {t}')
        line[8+left] = line[8+left][:t] + '[' + line[i+1] + ']' + line[8+left][t:]
    outf.write(' '.join(line[8:])+'\n')
                    
        
