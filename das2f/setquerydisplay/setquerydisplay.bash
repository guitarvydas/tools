#!/bin/bash
# usage: setquerydisplay root-directory here-directory target-name prefix-arg
fatal () {
    echo '$$ fatal setquerydisplay $$'
    exit 1
}

trap 'fatal' ERR

root=$1
sqddir=$2

target=$3
prefix=$4

prep=$root/prep/prep

$prep '.' '$'  \
      ${sqddir}/sqd.ohm ${sqddir}/sqd.glue \
      --stop=1 \
      --support=${sqddir}/support.js \
      --input=$target.md \
      $prefix
#pfr $1.md ${sqddir}/sqd.ohm ${sqddir}/sqd.glue --support=${sqddir}/support.js $2
