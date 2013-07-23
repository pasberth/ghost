#!/bin/sh

GHOSTDIR=$1 ; shift

X=0
Y=0

while getopts x:y: OPT ; do
  case $OPT in
    x) X=$OPTARG ;;
    y) Y=$OPTARG ;;
    ?) exit 1 ;;
  esac
done

mkdir -p     "$GHOSTDIR"          && \
mkfifo       "$GHOSTDIR"/view     && \
cat << YML > "$GHOSTDIR"/meta.yml
x: $X
y: $Y
YML