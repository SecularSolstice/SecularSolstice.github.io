# How to Do Useful Things with This Website 

* [How to Edit a Song](#how-to-edit-a-song)
* [How to Add or Edit a Speech](#how-to-add-or-edit-a-speech)
* [How to Create or Edit a Program](#how-to-create-or-edit-a-program)
* [How to Set Up a Local Environment](#how-to-set-up-a-local-environment)
* [How to Add a Song](#how-to-add-a-song)
* [How to Create Multiple PDFs from Lilypond](#how-to-create-multiple-pdfs-from-lilypond)
* [How to Avoid Difficult Technical Problems](#how-to-avoid-difficult-technical-problems)
* [How to Decide whether Something Belongs Here](#how-to-decide-whether-something-belongs-here)

## How to Edit a Song

On the song's page, there should be an "edit description" button and an "edit" button on one of the files at the bottom.  Click this button and follow github's instructions (including creating an account if you don't already have one -- they won't make you regret it).  If you don't have push priviliges, create a pull request.  If it isn't accepted soon, bug Daniel Speyer.

Or, if you prefer to work with a local copy, edit either the README.md or other substantive file in the song's directory, and then push or create a pull request as normal.  It should almost never be necessary to touch the Makefile.  If you want to generate the display copy to make sure it's good, you can do this with `make all`, but you don't have to.

In either case, each song has a single canonical format from which others are derived.  This ensures they never fall out of sync with each other.  Most of the formats should be pretty intuitive to edit.  Even lilypond, which can get quite complicated, is mostly safe to edit the parts you understand and ignore the ones you don't.

The description (README.md file) contains information *about* the song in markdown format.  It should begin:

        # Title
        ## By Composer
        ## One-line Synopsis

## How to Add or Edit a Speech

For editing, the speech page will contain an "edit" button similar to the ones on the song pages.  This will bring you to the same github editor.  Or, if you prefer to work with a local copy, you can find the files in the `speeches` directory.

For a new speech, go the the [git directory for speeches](https://github.com/SecularSolstice/SecularSolstice.github.io/tree/master/speeches) and click the "Create new file" button.  All speech filenames *must* have the `.md` extension.

The file should begin:

        # Title
        ## By Author

As with the songs, if you're using a local copy you can create a formatted version with `make all` but if you don't github will do it for you.

If you can categorize the speech, add it to `lists/All_Speeches.lst`, but don't worry too much if it doesn't fit.

## How to Create or Edit a Program

Programs live in the [lists directory](https://github.com/SecularSolstice/SecularSolstice.github.io/tree/master/lists).  For a new list click "Create new file", or to edit an existing one select the file and click the pencil icon.

The format of these files is very simple:

        {Subtitle, if any}
        # Section Heading
        Song_or_Speech
        Song_or_Speech
        # Another Section Heading
        .
        .
        .


You may wish to use the [list building tool](list_building.html) which provides smart auto-complete.  Or not.  Whichever.  Note that the tool does not have a save button: you'll need to copy+paste the content in and out.  But it's still nice to not have to look up exact names of things.

Note that the grand list of programs puts programs A-L in th left column and M-Z in the right.  This may not look good after you've added programs.  If you feel up to it, meddle with the `create-program-list.sh` script.  Or bug Daniel.

## How to Set Up a Local Environment

First gain basic proficiency with git.  There are lots of tutorials online, but I don't have a specific one to recommend.  Or, if you work any sort of technical job, you probably already have this.  If you skip this step, you'll be able to take the next bunch, but may get stuck *after* having done substantive work.

Install the tools you'll need.  This will always include `pandoc`, `python`, `git`, `make` and `imagemagick`.  If you're using lilypond format, you'll also want `lilypond`, `timidity`, `lame` and `frescobaldi`.  If you're using chordpro or ugc format, you'll also want `chordpro`, which annoyingly can only be installed from `cpanminus`.  For true thoroughness, get a recent version of `wkhtmltox` (one with the qt patch) and `pdfjam` (in the `texlive-extra-utils` package in most distros).  For exact commands on how to do this, see the [Dockerfile](https://github.com/SecularSolstice/SecularSolstice.github.io/blob/master/.github/workflows/Dockerfile).  Ignore the bit about getting the latest git -- only github actions need that.  (Technically you *could* work from inside a docker container, but I wouldn't recommend it.)

Then just `git clone https://github.com/SecularSolstice/SecularSolstice.github.io.git`.

You may wish to use `scripts/fixdates.sh` to set all Last Modified Times to the commits they were made on, rather than the time git cloned the files.  This will help ensure `make all` builds what it should and not what it shouldn't.

## How to Add a Song

This requires a local environment (for now; growth mindset).

Assuming you've already set that up and are in the root git directory, the steps are:

**`git pull`**

Nobody likes a merge conflict

**[optional] `M-x server-mode`**

If you're using emacs, invoke server-mode so that you get the edits automatically.  If you use a lesser editor, skip this step.

**`./scripts/mksong.sh <Name_Of_Song> <format>`**

Name_Of_Song will be used as the directory name.  It should not contain spaces or special characters.  You can set the name that will be displayed later.

Format can be one of the following (so far; growth mindset):

* **stub**: No content, just notes.  Often a good choice for well-documented outside songs that we still want to discuss how to use in a Solstice context
* **text**: Just lyrics as a text file, no attempt to record music
* **ugc**: Ultimate Guitar Chord format.  With chord names above lyrics.  Always Look on the Bright Side provides an [example](/Always_Look_on_the_Bright_Side/chord-sheet.ugc).
* **cho**: Chordpro Format, with chords in brackets amidst lyrics.  There's some bonus features for optimal viewing on an iphone while performing.  Somewhere to Begin provides an [example](/Somewhere_to_Begin/chord-sheet.cho)
* **ly**: Lilypond Format, complete sheet music.  This format is [documented](https://lilypond.org/manuals.html).  Bring the Light offers a relatively straightforward [example](/Bring_the_Light/sheet-music.ly).  If you're using this format seriously, you'll probably want the [Frescobaldi editor](https://frescobaldi.org).
* **mscx**: Music XML formal, also complete sheet music.  A [W3C Standard](https://www.musicxml.com/) supported natively by the open source [Musescore](https://musescore.org/en) and as an import/export format by many other programs.

This script will create a directory for the song and the relevant files (though the files with the content will be empty).

**Edit the Files**

If you're using emacsserver, these will show up automatically in your editor.  If not, open the created files manually.

**[optional] Add Any Extra Files**

If there are any other files you want included in this record (e.g. an mp3 of a past performance), copy those into the song's directory.

**[technically optional] `Autogen and Proofread`**

Use `make all` to fill the `gen` directory with the files that will go on the actual website.  Then open `gen/index.html` in your favorite web browser and make sure that everything looks right.

**Add to `All_Songs`**

Add the song your created to the `gen/All_Songs.lst` list.  Note that the list is alphabetical within each category, and the entries are the directory names.

**`git commit and push or pull-request`**

The same as any git project.

## How to Create Multiple PDFs from Lilypond

One of the handy features of lilypond is the ability to produce multiple variants or parts from a score.  If you want to do this, take a look at a song that already does to get a sense of what's going on.  Let There Be Love and Winter Is Icumen In are good examples.  Then...

In the makefile, include the added files both in the `FILES_TO_LIST` variable (no, it can't be auto-detected, or at least I couldn't make that work) and to the rules.  When invoking lilypond for a variant, use -dFlagName to *define* `FlagName` when examining the score.

Then in the `.ly` file, use

        #(if (ly:get-option 'FlagName) #{
            \lilypond commands to use with the flag
           #} #{     
            \lilypond commands to use without the flag
            #}
          )

The # characters shift between lilypond format and the underlying lisp.  Yes, lisp.  Why not?

## How to Avoid Difficult Technical Problems

If this still sounds too difficult (or you want to do something not
covered here and don't want to try figuring it out for yourself) send your
content to either Ruthan Freese (rcfreese [at] gmail [dot] com) who
has volunteered to be "official Github intermediary" or to Daniel
Speyer (dspeyer [at] gmail [dot] com) who set this whole thing up.

## How to Decide whether Something Belongs Here

If it's been used at a Solstice or was written for Solstice, it
belongs here.  If it was neither, but seems really good, that belongs
here too.  Songs that seem only kind of relevant probably don't belong
here, unless there's some specific reason to include them, or you
really want to.

Putting things here imposes very few costs.  Unless you're
thinking of adding so much that a list becomes unreadable, go ahead.
And if you are, then consider putting these things into a separate
list.

For songs used at Solstice, but not written for it and easy to find
elsewhere, I sometimes created stubs.  For example, [John Lennon's
Imagine](/Imagine/gen).  This enables including the song in setlists,
but doesn't take much effort or get in anyone's way.  When I do this,
I *don't* include them in the All Songs list, to avoid cluttering that
with links to pointless pages.
