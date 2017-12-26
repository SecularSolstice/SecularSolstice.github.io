# How to Add to this Website

## General Principles

This website is hosted [on a github repository](https://github.com/SecularSolstice/SecularSolstice.github.io/).
In addition to
robust, ad-free hosting, this gets us version tracking, history,
collaboration and branching/merging support.

This is as close to a bag of files as I could get it while still being
a viable website. All the HTML is auto-generated using
makefiles. Most of the content is in markdown. Hopefully this will make
it pretty easy to modify things and to bring things into formats
not-yet-conceived while also making things pretty.

Cloning your own git repo is recommended, as that will make the
autogeneration go much more smoothly. If that's not practical, you can
use github's web interface and ask someone else to run `make all`.

Programs used in the autogen scripts include lilypond, timidity, lame,
pandoc and python. Future developments are likely to include
wkhtmltopdf, LaTeX, abc2ly, imagemagick and ffmpeg. All of these are
available through apt or non-debian equivalents.

There are a few cases where make's dependency detection won't work. If
this seems to be happening, delete and remake the relevant files.

When in doubt, copy something already here.

## Adding a Song

  * Create a directory for it and a `gen/` subdirectory
  * Create a `README.md` file, starting with the title as a level-1
    header and the attribution and summary as level 2.
  * Create a canonical representation of the song. If a chord chart,
    call it `chart.csv`. If Lilypond, call it `sheet-music.ly`.
  * Create a `Makefile`. This must define the `PREFIX` and `FILES_TO_LIST`
    variables, provide a rule for `gen/${PREFIX}lyrics.txt` and include
    `../scripts/Makefile.common`. It may also provide rules for other
    files (such as the voice-only sheet music for Voicing of Fear).
    Note that the simple conversions are provided for you, but the
    lyrics are not because there's too much variation (but helpful
    scripts are provided).
  * Add any other files you want to make available.
  * Run `make all`
  * Add the song to the All Songs list in the appropriate place and to
    any other relevant lists.
  * Run `make all` on the lists as well.
  * Check that everything looks correct
  * Add everything to git, including the generated files
  * Commit and push

## Adding a Speech

  * Put it in the speeches directory in markdown format
  * Begin with the title as a level-1 header and the author as a
    level-2
  * Add it to the All Speeches lists and any other relevant lists
  * Run `make all` on first the speeches and then the lists
  * Check that everything looks correct
  * Add everything to git, including the generated files
  * Commit and push

## Adding a List

  * Create a file in the lists/ directory. Use # marks for headers. For
    speeches and songs, use the file/directory name, not the formatted
    title.
  * The name of your file should have underscores for spaces, but the
    capitalization you want to display. Also, lists will be
    alphabetized on the main page, so name accordingly (if this becomes
    a problem, alter the create-main-index.sh script).
  * Run `make all` in both the lists directory and the root.
  * Check that everything looks correct
  * Add everything, including the generated files
  * Commit and push

## Always check everything

## Always git add the generated files

## When in doubt, copy something already here
