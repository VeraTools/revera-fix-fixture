#!/bin/sh
# Runs every check in this file; exits non-zero if any fails.
set -eu
for f in lib/*.sh; do . "./$f"; done
fail=0
check() {
  if [ "$2" != "$3" ]; then
    echo "FAIL $1: got '$2', want '$3'"
    fail=1
  fi
}
check "clamp below" "$(clamp 1 5 9)" 5
check "clamp above" "$(clamp 12 5 9)" 9
check "clamp inside" "$(clamp 7 5 9)" 7
check "percent of zero" "$(percent 3 0)" 0
check "percent part below total" "$(percent 3 4)" 75
check "percent capped at 100" "$(percent 5 4)" 100
[ "$fail" -eq 0 ] && echo "all checks passed"
exit "$fail"
