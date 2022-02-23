# bash-apocryphal
### Essential texts for Bourne-Again faithful, unaccepted by the powers at be

This repository contains a collection of useful Bash utilities not found in any official package.

## Scripts

Most scripts accept both forms of input, as either command-line arguments or read from standard input `stdin` (pipeline, file redirect, etc.). See the header comments in the respective script file for more usage details.

|File|Description|
|:--:|:----------|
|[`chkvar`](bin/chkvar)|`chkvar` verifies a variable with given identifier is defined and that it does not have a "false-like" value.|
|[`elapsed`](bin/elapsed)|`elapsed` formats the given number of seconds using the given date-time format. If no date-time format is given, uses a default format.|
|[`escape`](bin/escape)|`escape` prints the given arguments in a quoted format that can be reused as input to other bash commands.|
|[`fprintf`](bin/fprintf)|`fprintf` is identical to `printf(1)`, except the first argument is a filepath to write to (append to file with flag `-a`). Useful when file redirection can be tricky or cumbersome (e.g., `xargs`, `find -exec`, etc.)|
|[`joinstr`](bin/joinstr)|`joinstr` prints all arguments following the first, delimited by the first. Nothing is printed if fewer than 2 arguments are given, and only the second argument is printed if exactly 2 are given.|
|[`prepath`](bin/prepath)|`prepath` echoes the `:`-delimited path variable with given name, prepended with each path in the given `:`-delimited list(s) of paths, removing each from its original location if it existed. Used to change the priority of directories in a path list.|
|[`relpath`](bin/relpath)|`relpath` constructs a relative path from the first argument to the second. If only one path is given, the first argument is assumed to be `$PWD`.|
|[`start`](bin/start)|`start` runs commands as a background job. It supports a lot of options for tracing and logging. See flag `-h` for details.|
|[`touchuniq`](bin/touchuniq)|`touchuniq` prints the given file path appended with an increasing numeric suffix such that no file exists at that path.|
|[`trim`](bin/trim)|`trim` prints the given input string with all leading and trailing whitespace removed. All arguments are joined together with a single space, and the result is trimmed as a single string.|
|[`trimslash`](bin/trimslash)|`trimslash` removes all trailing `/` from each of the given input strings, unless the remaining trailing `/` is also the leading slash (i.e., the root directory).|
|[`uniqpath`](bin/uniqpath)|`uniqpath` echoes each path from the given `:`-delimited list(s) of paths which does not already exist in the path variable with the given name. Useful for removing duplicate directories in a path list.|
|[`uniqstr`](bin/uniqstr)|`uniqstr` prints each unique string in the given input.|

## Functions

Functions are used when the operating behavior depends on the callers environment and/or should not be run in a subshell.

|Name|File|Description|
|:--:|:--:|:----------|
|`define`|[functions.bash](functions.bash)|`define` is syntactic sugar for assigning HEREDOC content to a variable. Works with quoted content (e.g., `define foo <<'EOF' ...`), as well as scripts that `set -e`.|
|`desc`|[functions.bash](functions.bash)|`desc` prints a shell-style declaration of the given variable identifiers. This can be useful with `eval`, logging, and scope-limited environments.|
