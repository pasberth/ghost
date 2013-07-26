#!/bin/sh

GHOSTDIR=$1 ; shift

ghost.exists "$GHOSTDIR" || exit $?

if [[ -e "$GHOSTDIR"/pid ]] ; then
  echo "$(basename $0): $GHOSTDIR: already in use" >&2
  exit 1
fi

echo $$ >> "$GHOSTDIR"/pid
eval $(ruby -ryaml -e 'meta = YAML.load($<.read); puts %w(x y).map{|k|"#{k}=#{meta[k]}"}.join("\n")' "$GHOSTDIR"/meta.yml)

FMT='\e[s\e[0;0f'

if [[ $x -gt 0 ]] ; then
  FMT+="\e[${x}C"
fi

if [[ $y -gt 0 ]] ; then
  FMT+="\e[${y}B"
fi

FMT+='%s\e[u'

PRINTCMD="printf '$FMT'"

function is_interact_now () {
  ps -av | grep "$PPID" | grep '+' > /dev/null 2>&1
}

while [[ -e $GHOSTDIR/view ]] ; do
  ( while true ; do
      while ! is_interact_now ; do sleep 0.0001 ; done
      eval $PRINTCMD \'"$view"\'
      sleep 0.0001
    done ) &
  display_pid=$!

  trap "kill '$display_pid' ; rm '$GHOSTDIR/pid' ; exit 1" 1 2 3 9 15

  view=$(cat "$GHOSTDIR"/view)
  kill "$display_pid" > /dev/null 2>&1
done

rm "$GHOSTDIR"/pid
