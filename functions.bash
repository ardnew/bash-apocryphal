#!/bin/bash

# define is syntactic sugar for assigning HEREDOC content to a variable. 
# Works with quoted content (e.g., define foo <<'EOF' ...), as well as scripts
# that set -e (since read returns non-zero on success).
define() { IFS='\n' read -r -d '' ${1} || true; }

# desc prints a shell-style declaration of the given variable identifiers.
# For example, 'export -A foo=([a]=b [c]=d); desc foo;' would print just the
# ident=val part: "foo=([a]=b [c]=d )". This can be useful for eval'ing or
# creating local environments.
desc() { for v; do declare -p ${v} 2>&1 | command grep -o "$v.*"; done; }

