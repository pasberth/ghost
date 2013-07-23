#!/bin/sh

GHOSTDIR=$1 ; shift

ghost.exists "$GHOSTDIR" || exit $?

if ! [[ -e "$GHOSTDIR"/pid ]] ; then
  exit 0
fi

kill $(cat "$GHOSTDIR"/pid)
echo > "$GHOSTDIR"/view
