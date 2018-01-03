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

## GitHub Advice

If you've used Github before, you can probably ignore this section.
Just remember that not everyone is, so don't do anything really
sophisticated with branches anywhere that anyone else will need to
look at it.

To do almost anything with Github, you need an account.  Go to
[github.com](https://github.com) and sign up.  Giving them your email
is safe: they won't spam you.  Don't worry about the features you
could pay for: you won't need any of them.

The most proper way to contribute content is a "pull request", a
bundle of proposed changes.  To do this, you must first create a
"fork", a copy of the project under your own username, still on
Github.  This may seem inelegantly heavyweight, but it's very little
actual effort, and puts very little burden on the servers.  Just go to
the [main project
page](https://github.com/SecularSolstice/SecularSolstice.github.io)
and click "fork".

Now you have your own copy of everything.  You can do whatever you
want here and it won't effect the main repository at all.

There are (at least) two ways to make changes.  One is through the web
interface.  There are "Create a new file" and "Upload files" buttons,
and when you view a file, there's a button with an icon of a pencil to
edit it.  Note that every change you make this way is a separate
commit (a commit is the fundamental unit of changing things in git)
and needs a message.  A one line explanation of what you did will
suffice.  Note that all the auto-generation scripts won't work this
way, but that's not a big deal.

Alternatively, you can clone the repository unto your local computer.
If you click the "Clone or download" button, you'll get a URL.  Go to
your command line and type `git clone ${THAT_URL}`.  You'll now have a
third copy of everything, this time on your own computer.  Make the
changes using your favorite tools, `git add` any files you create,
`git commit` everything, and then `git push` it all back to
your copy on github.

There are lots of guides to git on the internet.  [This
one](https://readwrite.com/2013/09/30/understanding-github-a-journey-for-beginners-part-1/)
seems pretty good.

Once you've made your changes, send a pull request back to the main
repository.  Github's [own
documentation](https://help.github.com/articles/creating-a-pull-request-from-a-fork/)
takes you through the process.  If you're not sure you did things
right, just mention your concerns in the pull request message.

## If That's Still Too Much

Git can be a lot to take on, depending on your background.  If you
want to contribute but don't want to deal with all this, send your
content to either Ruthan Freese (rcfreese [at] gmail [dot] com) who
has volunteered to be "official Github intermediary" or to Daniel
Speyer (dspeyer [at] gmail [dot] com) who set this whole thing up.
Try to get your content as close to the forms used here as is easy,
but don't sweat it.

## Want Push Access?

If you think you should have permissions to push straight here without
going through a pull request, you're probably right.  Contact Daniel
Speyer and remind him who you are.  Make sure to mention your Github
username.

(If you don't know what this means, don't worry, it doesn't affect you.)

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

## When in doubt, copy something already here
