#!/usr/bin/python

import sys,csv

fn = sys.argv[1]

inf = file(fn)
outf = file('gen/'+fn.replace('.lst','.html'), 'w')

title = fn.replace('.lst','').replace('_',' ')

outf.write("""
<html>
  <head>
    <title>%s</title>
    <link rel="stylesheet" type="text/css" href="../../theme.css">
  </head>
  <body>
    <h1>%s</h1>
""" % (title,title))

inul=False
for line in inf:
    line=line.strip()
    if line=='':
        continue
    if line[0]=='#':
        if inul:
            outf.write('</ul>\n')
            inul=False
        outf.write('<h2>%s</h2>\n' % line[1:])
    else:
        if not inul:
            outf.write('<ul>\n')
            inul=True
        try:
            readme = file('../%s/README.md' % line)
            for rl in readme:
                rl=rl.strip()
                if rl[:3]=='###':
                    pass
                elif rl[:2]=='##':
                    if rl[:6]=='## By ' or rl[:5]=='##By ':
                        outf.write(' <i class=small>%s</i>' % rl[2:].replace('By ','by '))
                    else:
                        outf.write(' &#x25e6; '+rl[2:])
                elif rl[:1]=='#':
                    outf.write('<li><b><a href=../../%s/gen/>%s</a></b> ' % (line, rl[1:]))
            outf.write('\n')
        except IOError:
            try:
                f = file('../speeches/%s.md' % line)
                for fl in f:
                    fl=fl.strip()
                    if fl[:6]=='## By ' or fl[:5]=='##By ':
                        outf.write(' <i class=small>%s</i>' % fl[2:].replace('By ','by '))
                    elif fl[:1]=='#':
                        outf.write('<li><b><a href=../../speeches/gen/%s.html>%s</a></b> ' % (line, fl[1:]))
            except IOError:
                outf.write('<li>%s [Not Available]' % line)

if inul:
    outf.write('</ul>')
    
outf.write("<a href=https://github.com/SecularSolstice/SecularSolstice.github.io/blob/master/lists/%s>Raw Git</a>" % fn)
    
outf.write('</body></html>')
outf.close()
