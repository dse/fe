# fe, the iron searcher

It's like ack or ag, but leverages find(1) and grep(1).

I wrote this primarily because I wanted something whose workings I
understood.

If you need to find Ferrous Bueller in your files, this is your
utility.

## There are others.

- [https://beyondgrep.com/](`ack-grep`)

- [https://geoff.greer.fm/ag/](`ag`, the Silver Searcher)

- [https://github.com/BurntSushi/ripgrep](`ripgrep`)

- [https://sift-tool.org/](`sift`)

- [https://github.com/monochromegane/the_platinum_searcher](`pt`, the Platinum Searcher)

- Other tools listed in:

  - <https://beyondgrep.com/more-tools/>
  - <https://github.com/BurntSushi/ripgrep#quick-examples-comparing-tools>

- `git grep`

## What do `fegrep` and `fefind` do, exactly?

-   They are pretty heavy front-ends to `grep` and `find`.

-   It optionally runs `feformat` for more nicely formatted output
    than `grep`'s default.

-   It handles file and directory exclusions better.

-   It has built-in common pattern searches such as `--non-ascii` and
    `--css-class`.

-   The ability to allow otherwise excluded file and directory
    patterns

## What's wrong with heavy front-ends?

-   To pass along options to `grep`, you have to specify each one
    individually.
