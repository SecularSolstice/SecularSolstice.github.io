#!/usr/bin/env python3

import sys,csv
from subprocess import run
from tempfile import mkdtemp
from os.path import exists, dirname
from os import remove
from glob import glob

fn = sys.argv[1]
inf = open(fn)
i = 0
outd = mkdtemp()
print(outd)

cssfn = dirname(sys.argv[0]) + '/../make-program-magic-that-is-probably-not-there.css'
cssoutf=open(cssfn,'w')
cssoutf.write('@page { size: legal; }')
cssoutf.close()

for line in inf:
    line=line.strip()
    if line=='' or line[0]=='#' or (line[0]=='{' and line[-1]=='}'):
        continue
    i += 1
    content = line.split(': ')[0]
    print(f'Trying "{content}" ({i})')
    if exists(f'../speeches/{content}.md'):
        run(['pandoc', ('../speeches/%s.md' % content), '-V', 'geometry:papersize={ 6in, 10.3in }', '-V', 'geometry:margin=0.5in', '-o', f'{outd}/{i}.pdf'], check=True)
        continue
    g=glob(f'../songs/{content}/*-chord-chart.pdf')
    if g:
        run(['cp', g[0], f'{outd}/{i}.pdf'], check=True)            
        continue
    for format in ['sheet-music-compact-legal', 'sheet-music-legal', 'sheet-music-drop', 'sheet-music-english', 'sheet-music-compact', 'sheet-music-modern', 'sheet-music', 'chord-sheet-2col-legal', 'chord-sheet-2col', 'chord-sheet-legal', 'chord-sheet', 'chord-chart-tools-drones', 'chord-chart', 'lyrics']:
        if content=='Here_and_Now' and format=='chord-chart':
            continue
        g=glob(f'../songs/{content}/gen/*-{format}.*')
        if g:
            print('  found %s'%format)
            found=False
            for fn in g:
                if fn.endswith('.pdf'):
                    run(['cp', fn, f'{outd}/{i}.pdf'], check=True)
                    found=True
                elif  fn.endswith('.html') or fn.endswith('.txt') :
                    run(['google-chrome', '--headless', '--disable-gpu', f'--print-to-pdf={outd}/{i}.pdf', fn], check=True)
                    found=True
                else:
                    print('    ignoring %s'%fn)
                    continue
            if found:
                break
    else:
        print(f'WARNING: skipping {content}')

run(['gs', '-dNOPAUSE', '-sDEVICE=pdfwrite', f'-sOUTPUTFILE={sys.argv[1]}.pdf', '-dBATCH'] + [ f'{outd}/{j}.pdf' for j in range(1,i+1) ], check=True)
print(outd)
remove(cssfn)
