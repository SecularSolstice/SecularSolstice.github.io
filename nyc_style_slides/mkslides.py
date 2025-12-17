#!/usr/bin/python

import sys
import os
from glob import glob
import re
import json

class Struct:
    def __init__(self, **kwargs):
        self.__dict__.update(kwargs)

basedir = os.path.dirname(__file__)+'/..'
name = sys.argv[1]

sections = []

for line in open(f'{basedir}/lists/{name}.list'):
    line = line.strip()
    if not line:
        continue
    elif line.startswith('#'):
        if line[1:].strip() == 'Dusk':
            continue
        sections.append(Struct(name=line[1:].strip(), content=[]))
    else:
        sections[-1].content.append(Struct(ref=line))
        mdf = glob(f'{basedir}/speeches/{line}.md')
        if not mdf:
            mdf = glob(f'{basedir}/songs/{line}/README.md')
        if mdf:
            sl = open(mdf[0]).readlines()
            if sl[0].startswith('# '):
                sections[-1].content[-1].name = sl[0][1:].strip()
            if sl[1].startswith('## '):
                sections[-1].content[-1].byline = sl[1][2:].strip()
        else:
            sections[-1].content[-1].name = sections[-1].content[-1].ref
        lyricfiles = glob(f'{basedir}/songs/{line}/gen/*-lyrics.txt')
        if lyricfiles:
            sections[-1].content[-1].lyrics=[]
            lyrics = open(lyricfiles[0]).read().strip()
            lyrics=re.sub('\n +','\n',lyrics)
            lyrics=re.sub('\n *\\.\\.\\. *','\n',lyrics)
            lyrics=re.sub('\\[[^\\]]+\\]','',lyrics)
            lyrics=re.sub('#[^\n]*\n','\n',lyrics)
            lyrics=lyrics.replace('(skip)','')
            paragraphs=re.split('\n\n+', lyrics)
            for pa in paragraphs:
                if not pa.strip():
                    continue
                p = pa.split('\n')
                while len(p)>5:
                    sections[-1].content[-1].lyrics.append('\n'.join(p[:4]))
                    p=p[4:]
                if len(p)==5:
                    sections[-1].content[-1].lyrics.append('\n'.join(p[:3]))
                    sections[-1].content[-1].lyrics.append('\n'.join(p[3:]))
                else:
                    sections[-1].content[-1].lyrics.append('\n'.join(p))
            

for s in sections:
    seclen = 0
    for c in s.content:
        seclen += 1
        if hasattr(c,'lyrics'):
            seclen += len(c.lyrics)
    secbkgs = len(glob(f'{basedir}/nyc_style_slides/backgrounds/{s.name.lower().replace(" ","_")}/*.jpg'))
    secdone = 0
    for c in s.content:
        conbkgs = len(glob(f'{basedir}/nyc_style_slides/backgrounds/{c.ref}/*.jpg'))
        if not (secbkgs or conbkgs):
            print(f'{basedir}/nyc_style_slides/backgrounds/{s.name.lower().replace(" ","_")}/*.jpg')
            print(f'{basedir}/nyc_style_slides/backgrounds/{c.ref}/*.jpg')
            raise Error()

        clen = 1
        if hasattr(c,'lyrics'):
            clen += len(c.lyrics)
        c.bkgs = []
        for i in range(clen):
            if conbkgs:
                si = int(conbkgs*i/clen)
                c.bkgs.append(f'backgrounds/{c.ref}/{si}.jpg')
            else:
                si = int(secbkgs*secdone/seclen)
                c.bkgs.append(f'backgrounds/{s.name.lower().replace(" ","_")}/{si}.jpg')
            secdone += 1
                    
out = json.dumps(sections, indent=2, default=lambda x:x.__dict__)
outf = open(f'{basedir}/nyc_style_slides/{name}.html', 'w')
outf.write(f'''
<html>
<head>
<title>{name.replace('_',' ')}</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="slide_engine.js"></script>
<script>
const sections = {out};
</script>
<body>
</body>
</html>
''')
