#!/bin/bash
# usage: querydisplay3 root-directory here-directory target-name prefix-arg
fatal () {
    echo '$$ fatal querydisplay $$'
    exit 1
}

trap 'fatal' ERR

root=$1
qddir=$2

target=$3
prefix=$4

prep=$root/prep/prep

# echo target ${target} 1>&2

$prep '.' '$'  \
      ${qddir}/qd3.ohm ${qddir}/qd3.glue \
      --stop=1 \
      --support=${qddir}/qd3support.js \
      --input=$target.md \
      $prefix
