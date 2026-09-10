#!/usr/bin/env bash
# 燠 okibi — clj-native test runner (babashka).
set -uo pipefail
cd "$(dirname "$0")"

SUITES=(
  "test/okibi/methods/test_okibi_edn.kotoba"
  "test/okibi/methods/test_analyze.kotoba"
  "test/okibi/methods/test_kotoba.kotoba"
  "test/okibi/methods/test_autorun.kotoba"
  "test/okibi/methods/test_claim.kotoba"
)

fail=0
for s in "${SUITES[@]}"; do
  echo "== $s =="
  if bb --classpath src:test "$s"; then :; else echo "FAILED: $s"; fail=1; fi
done
exit $fail
