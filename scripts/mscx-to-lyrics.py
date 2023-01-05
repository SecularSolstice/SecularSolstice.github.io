#!/usr/bin/python3

from collections import defaultdict
import sys
import xml.etree.ElementTree as ET

def dump():
    global acc
    global preprivs
    if not acc:
        if preprivs:
            print()
            preprivs=set()
        return
    pritext=''
    for v in acc:
        if len(acc[v])>len(pritext):
            pritext=acc[v]
    vs = set()
    for v in acc:
        if acc[v]==pritext:
            vs.add(v)
    if pritext and vs!=preprivs:
        print(f'\n[{",".join([partNames[v] for v in vs])}]')
        preprivs = vs
    vbt = defaultdict(set)
    for v in acc:
        if v not in vs and acc[v]:
            vbt[acc[v]].add(v)
    for t,tvs in vbt.items():
        pritext += f' ({",".join([partNames[v] for v in tvs])}: {t})'
    print(pritext)
    acc = defaultdict(str)

def eqs(d):
    o=set()
    for k1 in d:
        for k2 in d:
            if d[k1]==d[k2]:
                o.add((k1,k2))
    return o

tree = ET.parse(sys.argv[1])
root = tree.getroot()
partNames = [ p.find('trackName').text for p in root.findall('*/Part') ]
holders = root.findall('*/*/Measure/..')
mss = zip(*[ h.findall('Measure') for h in holders ])
acc = defaultdict(str)
preprivs = set()
for ms in mss:
    macc = defaultdict(str)
    for v,m in enumerate(ms):
        for l in m.findall('*/Lyrics'):
            if l.find('text') is not None:
                macc[v]+= l.find('text').text
            if l.find('syllabic') is None or l.find('syllabic').text == 'end':
                macc[v]+=' '
    if not macc:
        dump()
    if (acc and max([len(t) for t in acc.values()]) > 30 and
        any(['.' in v for v in macc.values()])):
        lfh=''
        for v in macc.values():
            if '.' in v:
                fh = v.split('.')[0] + '.'
                if len(fh) > len(lfh):
                    lfh = fh
        for k,v in macc.items():
            if v.startswith(lfh):
                acc[k] += lfh
                macc[k] = v[len(lfh):].lstrip()
        dump()
    if acc and eqs(acc) != eqs(macc):
        dump()
    if acc and max([len(t) for t in acc.values()]) > 80:
        dump()
    for v in macc:
        acc[v] += macc[v]
                
dump()
