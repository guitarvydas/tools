The final output of pass 4 contains blank lines and is unsorted.

Cleanup is done via use of `sed` and `sort` command line tools.

PROLOG requires that rules be continguous.  `Sort` accomplishes this (and more).

Note that `swipl` allows rules to be non-contiguous but requires declarations.  I haven't explored the trade-off.  For now, `sort` is "good enough".