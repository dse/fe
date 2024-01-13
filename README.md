# fe, the iron searcher

It's like ack or ag, but leverages find(1) and grep(1).

I wrote this primarily because I wanted something whose workings I
understood.

If you need to find Ferrous Bueller in your files, this is your
utility.

## There are others.

-   [ack](https://beyondgrep.com/)
-   [ag - the Silver Searcher](https://geoff.greer.fm/ag/)
-   [ast-grep](https://github.com/ast-grep/ast-grep)
-   [cgrep](https://awgn.github.io/cgrep/)
-   [git grep](https://git-scm.com/docs/git-grep)
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

## There is also good ole' grep.

-   `-I` excludes binary files.
-   `-r` recurses into subdirectories without following symlinks.
    -   If you want to follow symlinks, a potentially bad idea,
        specify `-R`.
-   You probably also want to specify:
    -   `--exclude-dir=node_modules`
    -   `--exclude-dir=.git`
-   You may want:
    -   `--exclude=\*.pdf`
    -   `--exclude=\*.doc`
    -   `--exclude=\*.xls`
    -   `--exclude=\*.ppt`
    
### Manpages

-   [gnu grep](https://www.gnu.org/software/grep/)
-   [FreeBSD grep](https://man.freebsd.org/cgi/man.cgi?grep(1))
-   [OpenBSD grep](https://man.openbsd.org/grep.1)
-   [Linux grep(1)](https://man7.org/linux/man-pages/man1/grep.1.html)

## Tool Lists

-   <https://beyondgrep.com/more-tools/>
-   <https://github.com/BurntSushi/ripgrep#quick-examples-comparing-tools>

## What do `fegrep` and `fefind` do, exactly?

-   They are pretty heavy front-ends to `grep` and `find`.

-   It handles file and directory exclusions better.

-   It has built-in common pattern searches such as `--non-ascii` and
    `--css-class`.

-   The ability to allow otherwise excluded file and directory
    patterns

## What's wrong with heavy front-ends?

-   To pass along options to `grep`, you have to specify each one
    individually.
