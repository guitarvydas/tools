#!/bin/bash
root=$1
target=$2

echo '** factbase pipeline **' 1>&2

# Layer 0. Convert helloword.drawio into factbase format using d2f.
echo '** layer 0 (' "$target" ' --> fb.pl) **' 1>&2
$root/d2f/d2f.bash $1 $2 >fb.pl
$root/das2f/run-fb-pipeline.bash $root
