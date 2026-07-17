#!/usr/bin/env bash
# 燠 okibi — clj-native test runner (babashka).
set -uo pipefail
cd "$(dirname "$0")"

SUITES=(
  "test/okibi/methods/test_okibi_edn.cljc"
  "test/okibi/methods/test_analyze.cljc"
  "test/okibi/methods/test_kotoba.cljc"
  "test/okibi/methods/test_autorun.cljc"
  "test/okibi/methods/test_claim.cljc"
)

fail=0
for s in "${SUITES[@]}"; do
  echo "== $s =="
  if bb --classpath src:test "$s"; then :; else echo "FAILED: $s"; fail=1; fi
done
exit $fail
