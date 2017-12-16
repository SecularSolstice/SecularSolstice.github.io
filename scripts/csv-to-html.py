#!/usr/bin/python

import sys,csv

inf = file(sys.argv[1])
outfn = sys.argv[2]
if outfn=='-':
    outf=sys.stdout
else:
    outf=file(outfn,'w')

title = outfn.split('/')[-1].replace('-',' ').replace('_',' ').replace('.html','').title()

outf.write("""
<html>
  <head>
    <title>%s</title>
    <link rel="stylesheet" type="text/css" href="../../theme.css">
  </head>
  <body>
    <h1>%s</h1>
""" % (title,title))

isheader=True
for line in csv.reader(inf):
    while line and line[-1]=='':
        line=line[:-1]
    if len(line)>1:
        if isheader:
            outf.write('<table border>\n')
        isheader=False
    if isheader:
        if line:
            outf.write('<h2>%s</h2>\n' % line[0])
    else:
        outf.write('<tr><td>%s</td></tr>\n' % '</td><td>'.join(line))

outf.write('</table></body></html>')
outf.close()
