#!/usr/bin/env python3

import os
import sys
import subprocess
from glob import glob
import re
from pathlib import Path
from html import escape

# Helpers

def run(cmd, *, capture=True):
    """Run a shell command."""
    if capture:
        return subprocess.check_output(cmd, encoding='utf-8')
    else:
        subprocess.check_call(cmd)

def is_text_file(path):
    out = subprocess.check_output(["file", path], encoding='utf-8')
    return "text" in out

PREFIX = sys.argv[1]

# Title

title = ""
if Path("README.md").exists():
    with open("README.md") as f:
        for line in f:
            if line.startswith("# "):
                title = line[2:].strip()
                break

if not title:
    title = Path.cwd().name.replace("_", " ")

# HTML header

print(f"""<html>
  <head>
    <title>{title}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <link rel=stylesheet href=../../../theme.css>
    <script src='../../../theme-switcher.js'></script>
""")

# OpenGraph image

thumb_path = Path("gen/thumb.png")
if thumb_path.exists():
    thumb_url = (
        "https://secularsolstice.github.io/songs/"
        f"{Path.cwd().name}/gen/thumb.png"
    )
    print(f"    <meta property='og:image' content='{thumb_url}' />")
    print(f"    <meta name='twitter:image' content='{thumb_url}' />")

print(f"    <meta property='og:title' content='{title}' />")

# Description

desc = ""
if Path("README.md").exists():
    with open("README.md") as f:
        lines = f.readlines()[1:5]  # head -n 5 | tail -n 4
        desc = "".join(lines)
        desc = desc.translate(str.maketrans("", "", "'#"))
        desc = re.sub(r"\n+", "%", desc)
        desc = re.sub(r"% *%", "%", desc)
        desc = desc.replace("%", " // ")

print(f"    <meta property='og:description' content='{desc}' />")
print("  </head>  <body> ")

# Header include

script_dir = Path(__file__).resolve().parent
header_path = script_dir / "../misc/header.html"
if header_path.exists():
    print(header_path.read_text())

# Notes

print('<div class=notes>')
print(run(["pandoc", "-f", "markdown", "README.md"], capture=True))
print("<p><a href="
      "https://github.com/SecularSolstice/SecularSolstice.github.io/edit/master/"
      f"songs/{Path.cwd().name}/README.md "
      "class=editbutton>edit description</a></p>")
print("</div>")

# Lyrics

print("<h2>Lyrics</h2>")

variant_lyric_files = [ fn for fn in
                        glob(f'gen/{PREFIX}*lyrics.txt')
                        if '--' in fn ]
variants = [ fn.split('--')[0].replace(f'gen/{PREFIX}','')
             for fn in variant_lyric_files ]
variants.sort()
             
if variants:
    print("<ul><b>Variants:")
    for v in ["default"] + variants:
        print(
            f"<a class=lyrics_button onclick=\"choose('lyrics','{v}')\" "
            f"id='{v}_lyrics_button'>{v.title()}</a>"
        )
    print("</b></ul>")

for v in ["default"] + variants:
    print(f"<p class=lyrics id='{v}_lyrics'>")

    if v == "default":
        fn = f'gen/{PREFIX}lyrics.txt'
    else:
        fn = f'gen/{PREFIX}{v}--lyrics.txt'

    try:
        text = escape(Path(fn).read_text())
    except FileNotFoundError:
        print("<i>Lyrics Not Available</i>")
        continue

    lines = text.splitlines()
    cleaned = []
    for line in lines:
        if line.startswith("   "):
            line = "&nbsp; &nbsp; &nbsp; " + line[3:]
        if line.strip() or cleaned and cleaned[-1].strip():
            cleaned.append(line + "<br>")

    print("\n".join(cleaned))
    print("</p>")

if variants:
    print(
        '<script>'
        'choose("lyrics",(new URLSearchParams(location.search)).get("variant") || "default");'
        '</script>'
    )

# Files

print("<h2>Files</h2><ul>")

variants = set()
for f in glob('*--*'):
    variants.add(f.split('--')[0])
for f in glob(f'gen/{PREFIX}*--*'):
    variants.add(f.replace(f'gen/{PREFIX}','').split('--')[0])
variants = list(variants)
variants.sort()

for v in ["Default"] + variants:
    if variants:
        print(f"<h4>{v.title()}</h4>")

    if v == "Default":
        vfilt=lambda s: '--' not in s
    else:
        vfilt=lambda s: f'{v}--' in s

    files = []
    for p in Path(".").iterdir():
        if p.name in ("gen", "Makefile", "README.md"):
            continue
        if p.name.endswith("~"):
            continue
        if not vfilt(p.name):
            continue
        files.append(p.name)

    for f in sorted(files):
        print(f"<li><a href=../{f}>{f}</a>")
        if is_text_file(f):
            print(
                "<a href="
                "https://github.com/SecularSolstice/SecularSolstice.github.io/edit/master/"
                f"songs/{Path.cwd().name}/{f} "
                "class=editbutton>edit</a>"
            )

    gen_files = []
    for ext in ("pdf", "midi", "html", "mp3", "txt", "png", "chordpro", "cho"):
        gen_files.extend(glob(f"gen/*.{ext}"))

    gen_files = [
        Path(f).name for f in gen_files
        if "index" not in f and vfilt(f)
    ]

    for f in sorted(gen_files):
        print(f"<li><a href={f}>{f}</a>")

print("</ul>")

print(
    "<a class=rawgit href="
    "https://github.com/SecularSolstice/SecularSolstice.github.io/tree/master/"
    f"songs/{Path.cwd().name}>Raw Git Folder</a>"
)

print("</body></html>")
