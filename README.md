# fe, the iron searcher

`fe` is a recursive file search tool that mostly leverages `grep`.

Its semantics are quite simple and well-defined.

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

In macOS, if a `ggrep` executable is found, it will use that instead
of the operating system's `grep`.

If invoked from `emacs`, it will set output options that emacs will
recognize and process.  If you use `M-x grep` and use `fe`, you do not
need to specify those options.

