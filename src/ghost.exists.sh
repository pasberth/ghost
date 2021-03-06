#!/bin/sh

GHOSTDIR=$1 ; shift

if ! [[ -d "$GHOSTDIR" ]] ; then
  echo "$(basename $0): $GHOSTDIR: No such file or directory" >&2
  exit 2
elif ! [[ -p "$GHOSTDIR"/view ]] || ! [[ -f "$GHOSTDIR"/meta.yml ]]; then
  echo "$(basename $0): $GHOSTDIR: Invalid directory" >&2
  exit 1
fi