## find usage

```
find usage:
    find [<global-option> ...] [<starting-point> ...] <fefind-injected-arguments> [<find-argument> ...]
<global-option>:
    -D
    -O
    -H
    -L
    -P
<starting-point>:
    anything that isn't a <find-argument> or <global-option>
    such as a pathname
<find-argument>:
    starting with '!' or '(' or '-'*
```

## fe usages

```
fe <pattern>
    fefind -- -print0 | xargs -0 grep -e <pattern>
fe -e <pattern> -e <pattern>
    fefind -- -print0 | xargs -0 grep -e <pattern> -e <pattern>
```

## built-in patterns

```
fe --non-ascii
    fefind -- -print0 | xargs -0 grep --perl-regexp -e '<non-ascii-pattern>'
fe --perl-regexp --non-ascii
    fefind -- -print0 | xargs -0 grep --perl-regexp -e '<non-ascii-pattern>'
fe --fixed-strings --non-ascii
    # --fixed-strings conflicts with --non-ascii, which requires --perl-regexp
```

## options passed to fefind/find

```
fe --mindepth=1 --maxdepth=1 ...
    fefind ... -mindepth 1 -maxdepth 1 ...
```
