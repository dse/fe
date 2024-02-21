# fe, the iron searcher

`fe` is a recursive file search tool that leverages `grep`.

I wrote this because I needed something with simple, well-defined
semantics that I controlled.  I also needed something I could use with
numerous `grep` options.

## Directory and File Exclusions

`fe` excludes certain directories you probably don't want to include
from searches, including but not limited to:

-   `node_modules`
-   `.git`

`fe` excludes certain types of binary files that you probably don't
want to include, including but not limited to:

-   backup and temporary files
-   binary executables and shared libraries
-   compiled formats for interpreted or quasi-interpreted code
-   images
-   audio and video files
-   archive and/or compression formats
-   error correction formats

To print a list of directory and file exclusions:

    fe --list-excludes
    
There are many.  To print each on its own line:

    fe --list-excludes | cat

## MacOS

In macOS, if a `ggrep` executable is found, it will use that instead
of the operating system's `grep`.  I'm thinking about undoing this.

## Emacs

If invoked from `emacs`, it will set output options that emacs will
recognize and process.  If you use `M-x grep` and use `fe`, you do not
need to specify those options.

## Handy Search Patterns

`fe` also provides a few options that specify handy patterns to search
for:

-   `--non-ascii`.  Requies `-E`, `-G` (the default), or `-P`.

-   `--html-css-class`.  Requires `-E` or `-P`.

None of these patterns specify `-E`, `-F`, `-G`, or `-P`; you must
specify it yourself.

If you use any of these, then you must use `-e` to specify any
additional patterns.  You need not, and must not, specify `-e` before
any of *these* pattern options, however.
