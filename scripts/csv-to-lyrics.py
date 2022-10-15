#!/usr/bin/env python3

import sys, csv, os

inf = open(sys.argv[1],encoding='utf-8')
outfn = sys.argv[2]
if outfn == "-":
    outf = sys.stdout
else:
    os.makedirs(os.path.dirname(outfn), exist_ok=True)
    outf = open(outfn, "w",encoding='utf-8')
col = int(sys.argv[3])

beginning = True

for line in csv.reader(inf):
    if len(line) <= col:
        continue

    chop = line[col:]
    s = " ".join(chop)
    if "partial measure" in s:
        continue

    while "  " in s:
        s = s.replace("  ", " ")

    s = s.rstrip()

    if not s and beginning:
        continue
    beginning = False

    if " / " in s:
        s = s.replace(" / ", "\n") + "\n"
    outf.write(s + "\n")
outf.close()
