# #!/bin/bash
# for debugging/bootstrapping
root=$1
name=$2
d2fdir=$root/d2f
prep=$root/prep/prep
sed=sed
sort=sort
$prep '.' '$' $d2fdir/drawio.ohm $d2fdir/drawio.glue --input=$name --stop=1 --support=$d2fdir/support.js \
    | $prep '.' '$' $d2fdir/diagram.ohm $d2fdir/diagram.glue --stop=1 --support=$d2fdir/support.js \
    | $prep '.' '$' $d2fdir/styleexpander.ohm $d2fdir/styleexpander.glue --stop=1 --support=$d2fdir/support.js


