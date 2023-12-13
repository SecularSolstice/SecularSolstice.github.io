#!/usr/bin/env python

import sys, re

def parseAsChords(line):
    ws = re.split('( +)', line)
    out = {'klass': 'chords', 'val':[]}
    pos = 0
    for w in ws:
        if re.match('^[A-G][A-Gmajd0-9#b/sus]*$', w):
            out['val'].append([pos,w])
        elif not re.match('^ *-? *$', w):
            return False
        pos += len(w)
    return out

def parseLine(line, nextline):
    if re.match('^[- ]*$', line):
        return { 'klass': 'blank' }
    if re.match('^\\[[A-Za-z0-9 -]*\\] *', line):
        return { 'klass': 'heading', 'val':line.strip()[1:-1]}
    chords = parseAsChords(line)
    if chords:
        return chords
    text = line
    if re.match('^-+$', nextline):
        return { 'klass': 'title', 'val': text }
    return { 'klass': 'text', 'val': text }
        

def parse(inf):
    line = inf.readline().rstrip()
    wasblank = False
    for nextline in inf:
        nextline = nextline.rstrip()
        v = parseLine(line, nextline)
        if not (wasblank and v['klass']=='blank'):
            yield v
        wasblank = (v['klass'] == 'blank')
        line = nextline
    yield parseLine(line, '')

def pad(s, l):
    return s + ' '*(max(l-len(s), 0))
    
def mergechords(text, chords):
    out = ''
    last = 0
    for c in chords:
        if c[0]<len(text)-2 and text[c[0]]!=' ' and text[c[0]+1]==' ':
            c[0]+=1
        out += pad(text[last:c[0]], c[0]-last)
        out += '[' + c[1] + ']'
        last = c[0]
    out += text[last:]
    return out
    
savedchords = None
for p in parse(open(sys.argv[1])):
    if sys.argv[2] == '--lyrics':
        if p['klass']=='text':
            cleaner = re.sub(' +- +', '', p['val'])
            cleaner = re.sub(' +', ' ', cleaner)
            print(cleaner)
        if p['klass']=='blank':
            print('')
        if p['klass']=='heading':
            print('# '+p['val'])
    if sys.argv[2] == '--cp':
        if p['klass']=='chords':
            if savedchords:
                print(' '.join([ '[%s]'%c[1] for c in savedchords ]))
            savedchords = p['val']
        if p['klass']=='text':
            if savedchords:
                print(mergechords(p['val'], savedchords))
                savedchords = None
            else:
                print(p['val'])
        if p['klass']=='blank':
            print('')
        if p['klass']=='title':
            print('{title: %s}' % p['val'])
        if p['klass']=='heading':
            print('{comment: '+p['val']+'}')
