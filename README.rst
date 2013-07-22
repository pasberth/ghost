Ghost
================================================================================

Examples
--------------------------------------------------------------------------------

**watch**

```sh
PATH=`pwd`/bin:$PATH

ghost.new watch
ghost.open watch &
while true ; do  printf "\e[30;47m%s\e[0m" "$(date)" > watch/view ; done &
ghost.close watch
```

**SAM**

```sh
PATH=`pwd`/bin:$PATH

ghost.new sam
ghost.open sam &
SAM=""
( for x in `seq 300` ; do SAM="SAM $SAM" ; echo "\e[30;41;m$SAM\e[0m" > sam/view ; sleep 0.1; done && while true ; do echo "\e[30;41;m$SAM\e[0m" > sam/view ; done ) &
ghost.close sam
```