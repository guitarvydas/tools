#!/bin/bash
root=$1
target=$2
das2jdir=$root/das2j
$root/das2f/das2f.bash $root $target >fb.pl
${das2jdir}/layercomponent_query.bash
