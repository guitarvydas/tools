# #!/bin/bash
# # convert a .drawio diagram into a factbase
# usage: d2f.bash <root> <drawing>
# where <root> is a directory (typically ..) where prep/prep can be found
# where <drawing> is the name of a .drawio file
# example usage: ./d2f.bash .. ./helloworld.drawio
root=$1
name=$2
d2fdir=$root/d2f
prep=$root/prep/prep
sed=sed
sort=sort

# for debug
$root/d2f/expand.bash $1 $2 >_d2f.fb.pl

$prep '.' '$' $d2fdir/drawio.ohm $d2fdir/drawio.glue --input=$name --stop=1 --support=$d2fdir/support.js \
     | $prep '.' '$' $d2fdir/diagram.ohm $d2fdir/diagram.glue --stop=1 --support=$d2fdir/support.js \
     | $prep '.' '$' $d2fdir/styleexpander.ohm $d2fdir/styleexpander.glue --stop=1 --support=$d2fdir/support.js \
     | $prep '.' '$' $d2fdir/factbase.ohm $d2fdir/factbase.glue --stop=1 --support=$d2fdir/support.js \
     | $sed -E -e 's/</\n</g' \
     | $sort \
     | $sed -E -e '/^[ \t]*$/d'

# comment: using $... for EVERY command and file reduces dependencies (because every command must be explicitly specified)
#  sed and sort assume builtin versions, but we might specify full pathnames for them, too

# uses: ../prep/prep
