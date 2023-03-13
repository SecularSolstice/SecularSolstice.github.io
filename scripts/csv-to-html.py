#!/usr/bin/env python3

import sys,csv

inf = open(sys.argv[1])
outfn = sys.argv[2]
if outfn=='-':
    outf=sys.stdout
else:
    outf=open(outfn,'w')

title = outfn.split('/')[-1].replace('-',' ').replace('_',' ').replace('.html','').title()

outf.write("""
<html>
  <head>
    <title>%s</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../../../theme.css">
    <script src='../../../theme-switcher.js'></script>
  </head>
  <body>
    <h1>%s</h1>
""" % (title,title))

data=list(csv.reader(inf))
maxlen=0
for i,_ in enumerate(data):
    while data[i] and data[i][-1]=='':
        data[i]=data[i][:-1]
    if len(data[i])>maxlen:
        maxlen=len(data[i])
        
isheader=True
for line in data:
    if len(line)>1:
        if isheader:
            outf.write('<table border>\n')
        isheader=False
    if isheader:
        if line:
            outf.write('<h2>%s</h2>\n' % line[0])
    else:
        for i,_ in enumerate(line):
            if i!=len(line)-1 or len(line[i])<3:
                line[i] = '<td>%s</td>' % line[i]
            else:
                line[i] = '<td colspan=%d>%s</td>' % (maxlen-len(line)+1, line[i])
        outf.write('<tr>%s</tr>\n' % ''.join(line))

outf.write('</table></body></html>')
outf.close()
