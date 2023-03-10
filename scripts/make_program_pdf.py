#!/usr/bin/env python3

import sys,csv
from subprocess import run
from tempfile import mkdtemp
from os.path import exists
from glob import glob

fn = sys.argv[1]
inf = open(fn)
i = 0
outd = mkdtemp()
print(outd)
    

for line in inf:
    line=line.strip()
    if line=='' or line[0]=='#' or (line[0]=='{' and line[-1]=='}'):
        continue
    i += 1
    content = line.split(': ')[0]
    print(f'Trying "{content}" ({i})')
    if exists(f'../speeches/{content}.md'):
        run(['pandoc', ('../speeches/%s.md' % content), '-o', f'{outd}/{i}.pdf'], check=True)
        continue
    for format in ['sheet-music-drop', 'sheet-music-english', 'sheet-music-compact', 'sheet-music', 'chord-sheet-2col', 'chord-sheet', 'chord-chart-tools-drones', 'chord-chart', 'lyrics']:
        if 'chord-chart' in format and ('Bitter' in content or 'Brighter' in content or 'Endless' in content or 'Here' in content):
            continue
        g=glob(f'../songs/{content}/gen/*-{format}.*')
        if g:
            if g[0].endswith('.pdf'):
                run(['cp', g[0], f'{outd}/{i}.pdf'], check=True)
            else:
                run(['google-chrome', '--headless', '--disable-gpu', f'--print-to-pdf={outd}/{i}.pdf', g[0]], check=True)
            break
    else:
        print(f'WARNING: skipping {content}')

run(['gs', '-dNOPAUSE', '-sDEVICE=pdfwrite', f'-sOUTPUTFILE={sys.argv[1]}.pdf', '-dBATCH'] + [ f'{outd}/{j}.pdf' for j in range(1,i+1) ], check=True)
print(outd)
