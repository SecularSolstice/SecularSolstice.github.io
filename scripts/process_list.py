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
    <div class=header>
      <a href="/">Home</a>
      <a href="/lists/gen/All_Songs.html">Songs</a>
      <a href="/lists/gen/All_Speeches.html">Speeches</a>
      <a href="http://secularsolstice.com/blog/">Blog</a>
    </div>
    <h1>%s</h1>
""" % (title,title))

def process_instruction(line):
    if line[0]=='[' and line[-1]==']':
        outf.write('<li style="list-style:none;font-size:smaller;"><i>%s</i>' % line)
        return True
    else:
        return False

def process_song(line):
    try:
        readme = file('../%s/README.md' % line)
    except IOError:
        return False
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
    return True

def process_speech(line):
    try:
        f = file('../speeches/%s.md' % line)
    except IOError:
        return False
    for fl in f:
        fl=fl.strip()
        if fl[:2]=='##' and ('by' in fl or 'By' in fl):
            outf.write(' <i class=small>%s</i>' % fl[2:].replace('By ','by '))
        elif fl[:1]=='#':
            outf.write('<li><b><a href=../../speeches/gen/%s.html>%s</a></b> ' % (line, fl[1:]))
    return True

def process_failure(line):
    outf.write('<li>%s [Not Available]' % line)
    return True

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
        process_instruction(line) or process_song(line) or process_speech(line) or process_failure(line)

if inul:
    outf.write('</ul>')
    
outf.write("<a class=rawgit href=https://github.com/SecularSolstice/SecularSolstice.github.io/blob/master/lists/%s>Raw Git</a>" % fn)
    
outf.write('</body></html>')
outf.close()
