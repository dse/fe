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

    (setq grep-find-command "fe ")

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

## Other Greppers

-   [ack](https://beyondgrep.com/)
-   [ag - the Silver Searcher](https://geoff.greer.fm/ag/)
-   [ast-grep](https://github.com/ast-grep/ast-grep)
-   [cgrep](https://awgn.github.io/cgrep/)
-   [git](https://git-scm.com/) includes [git grep](https://git-scm.com/docs/git-grep)
-   [glark](https://github.com/jpace/glark)
-   [grab](https://github.com/stealth/grab)
-   [greple](https://github.com/kaz-utashiro/greple)
-   [grin](https://pypi.python.org/pypi/grin)
-   [paragrep](https://software.clapper.org/paragrep/)
-   [pss](https://github.com/eliben/pss/) - an ack clone
-   [pt - the Platinum Searcher](https://github.com/monochromegane/the_platinum_searcher)
-   [qgrep](https://github.com/zeux/qgrep)
-   [rak](https://github.com/danlucraft/rak) - an ack clone
-   [rg - ripgrep](https://github.com/BurntSushi/ripgrep)
-   [rga](https://github.com/phiresky/ripgrep-all) - ripgrep, but also searches PDFs, ebooks, Office documents, `.zip` and `.tar.gz` files, and more.
-   [sift](https://sift-tool.org/)
-   [spot](https://github.com/rauchg/spot)
-   [ucg - UniversalCodeGrep](https://github.com/gvansickle/ucg)
-   [ugrep](https://github.com/Genivia/ugrep)
