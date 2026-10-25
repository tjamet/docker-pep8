#!/bin/sh
# Proves linting works through the image entrypoint.
# Usage: tests/smoke.sh <image>
# Matches on pycodestyle codes only, so a later pycodestyle output format
# keeps working.
set -u

image=${1:?usage: smoke.sh <image>}
dir=$(cd "$(dirname "$0")" && pwd)

run() {
  docker run --rm -v "$dir:/src:ro" -w /src "$image" "$@" 2>&1
}

out=$(run clean.py)
status=$?
if [ "$status" -ne 0 ] || [ -n "$out" ]; then
  echo "clean.py: want exit 0 and no output, got exit $status: $out" >&2
  exit 1
fi

out=$(run bad.py)
status=$?
if [ "$status" -eq 0 ]; then
  echo "bad.py: want non-zero exit, got 0" >&2
  exit 1
fi
for code in E501 E225; do
  case $out in
    *"$code"*) ;;
    *) echo "bad.py: output lacks $code: $out" >&2; exit 1 ;;
  esac
done

echo "smoke ok"
