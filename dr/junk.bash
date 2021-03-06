#!/bin/bash
cwd=`pwd`
prep=../prep/prep
# PROLOG support files (*.pl) are found in ../das2f
plpath=`realpath ../das2f/`
plpath=${plpath}/
temp=/tmp/temp_${RANDOM}
mdfile=dr-edgecontainment.md
fname=`basename -s '.md' $mdfile`
$prep "cond\n" "endcond\n" cond.ohm cond.glue --errorview --stop=1 --support=${cwd}/drsupport.js <dr-edgecontainment.md >$temp
# $prep "." "$" designrule.ohm designrulea.glue --exclusive --errorview --stop=1 --support=${cwd}/drsupport.js --PLPATH=${plpath} <$temp >a-$fname
# $prep "." "$" designrule.ohm designruleb.glue --exclusive --errorview --stop=1 --support=${cwd}/drsupport.js --PLPATH=${plpath} <dr-edgecontainment.md >b-$fname
# # rm $temp
