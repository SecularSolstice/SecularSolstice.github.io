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
        if line[1:].strip() == 'Dusk': # Special Case
            continue
        sections.append(Struct(name=line[1:].strip(), content=[]))
    else:
        cont = Struct(ref=line)
        if line=='Brighter_Than_Today': # Special Case
            sections[-2].content.append(cont)
        else:
            sections[-1].content.append(cont)
        mdf = glob(f'{basedir}/speeches/{line}.md')
        if not mdf:
            mdf = glob(f'{basedir}/songs/{line}/README.md')
        if mdf:
            sl = open(mdf[0]).readlines()
            if sl[0].startswith('# '):
                cont.name = sl[0][1:].strip()
            if sl[1].startswith('## '):
                cont.byline = sl[1][2:].strip()
        else:
            cont.name = cont.ref
        if cont.ref == 'When_I_Die': # Special Case:
            continue
        lyricfiles = glob(f'{basedir}/songs/{line}/gen/*-lyrics.txt')
        if lyricfiles:
            cont.lyrics=[]
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
                    cont.lyrics.append('\n'.join(p[:4]))
                    p=p[4:]
                if len(p)==5:
                    cont.lyrics.append('\n'.join(p[:3]))
                    cont.lyrics.append('\n'.join(p[3:]))
                else:
                    cont.lyrics.append('\n'.join(p))
        # Special Case:
        if cont.ref=='Brighter_Than_Today':
            cont.lyrics.pop()
            cont.lyrics[-1]=''
            cont.video = {'src':'videos/BrighterThanToday_final_chorus.mp4',
                          'start': len(cont.lyrics),
                          'fadePrev': 5000,
                          'css': {'left':'0vw', 'top':'0vh', 'width':'100vw', 'position':'absolute'} }
        if cont.ref=='Five_Thousand_Years':
            cont.video = {'src':'videos/known_universe.mp4',
                          'start': 1,
                          'css': {'left':'0vw', 'top':'0vh', 'width':'100vw', 'position':'absolute', 'zIndex': '-2'} }
        if cont.ref=='We_Are_Here':
            cont.name=''
            cont.byline=''
            cont.instructions = 'Hold on this blank slide until "If amyone is still sitting, please rise"'
        if cont.ref=='Call_and_Response_Defiance_Abridged':
            crs = [('The universe is vast, and dark, and cold.','But we are not.'),
                   ('The laws of physics are indifferent to hope, or desperation, or love.',
                    'But we are not.'),
                   ('There is no destiny written for us.',
                    'Then we will write our own.'),
                   ('Does anything in the universe care?',
                    'Yes! We care! There is light in the world, and it is us!')]
            for call,resp in crs:
                sections[-1].content.append(Struct(ref=call,
                                                   name=f'''
                  <div style=font-size:50%>[call]</div>
                  <div style=font-style:italic>{call}</div>
                  <div style=font-size:50%>[response]</div>
                  <div style=font-size:150%>{resp}</div>               '''))

for s in sections:
    seclen = 0
    for c in s.content:
        seclen += 1
        if hasattr(c,'lyrics'):
            seclen += len(c.lyrics)
    secbkgs = len(glob(f'{basedir}/nyc_style_slides/backgrounds/{s.name.lower().replace(" ","_")}/*.jpg'))
    secdone = 0
    for ci,c in enumerate(s.content):
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
                if s.name=='Night': # Special Case
                    if ci < 1:
                        si = 1
                    elif ci < 3:
                        si = 2
                    elif ci < 5:
                        si = 3
                    else:
                        si = 4
                c.bkgs.append(f'backgrounds/{s.name.lower().replace(" ","_")}/{si}.jpg')
            secdone += 1

for sec in sections:
    sec.content.insert(0,Struct(name=sec.name, klass='sectionHeader'))
    sec.content[0].bkgs = [ sec.content[1].bkgs[0] ]
    # Special Cases
    if sec.name=='Light':
        sec.content[0].name=name.replace('_tentative','').replace('_',' Solstice ')
        sec.content[0].byline="<span style=color:white>\n\nHasn't quite started yet.\n\nPlease take a seat and silence your cell phone</span>"
        sec.content[0].instructions = 'Hold on this slide until "When you\'re chewing on life\'s gristle"'
    if sec.name=='Night':
        sec.content[0].name='Intermission'
        sec.content[0].bkgs[0]=sec.content[0].bkgs[0].replace('1','0')
    if sec.name in {'Light', 'Twilight', 'Morning'}:
        sec.content[0].klass = 'sectionHeaderBlack'
        
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
