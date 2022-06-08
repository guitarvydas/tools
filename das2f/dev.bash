#echo use run.bash instead
#exit 1
# generate queries
#
# usage: ./make.bash <tools-root>

root=..

here=`pwd`
temp=temp_${RANDOM}

qd3=$here/qd3/querydisplay3.bash
sqd=$here/setquerydisplay/setquerydisplay.bash
prep=$root/prep/prep

$prep '#+ forall ' '#+ ' forall.ohm forall.glue --support=$here/forall.support.js --exclusive <layerkind.md >preprocessed_layerkind.md
$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js --exclusive <preprocessed_layerkind.md >preprocessed2_layerkind.md
$qd3 $root $here/qd3   preprocessed2_layerkind --prefix="$here/"  >layerkind_query.bash
chmod a+x layerkind_query.bash
echo '-- layerkind_query.bash generated --' 1>&2

$prep  "#+ forall " "#+ " forall.ohm forall.glue  --support=$here/forall.support.js --exclusive <layercolor.md >preprocessed_layercolor.md
$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js --exclusive <preprocessed_layercolor.md >preprocessed2_layercolor.md
$qd3 $root $here/qd3    preprocessed2_layercolor --prefix="$here/" >layercolor_query.bash
chmod a+x layercolor_query.bash
echo '-- layercolor_query.bash generated --' 1>&2

$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js <layername.md >preprocessed_layername.md
$qd3 $root $here/qd3   preprocessed_layername --prefix="$here/"  >layername_query.bash
chmod a+x layername_query.bash
echo '-- layername_query.bash generated --' 1>&2

$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js <layerboundingbox.md >preprocessed_layerboundingbox.md
$qd3 $root $here/qd3   preprocessed_layerboundingbox --prefix="$here/"  >layerboundingbox_query.bash
chmod a+x layerboundingbox_query.bash
echo '-- layerboundingbox_query.bash generated --' 1>&2

$prep  "#+ forall " "#+ " forall.ohm forall.glue  --support=$here/forall.support.js --exclusive <layerdirection.md >preprocessed_layerdirection.md
$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js  --exclusive <preprocessed_layerdirection.md >preprocessed2_layerdirection.md
$qd3 $root $here/qd3    preprocessed2_layerdirection --prefix="$here/" >layerdirection_query.bash
chmod a+x layerdirection_query.bash
echo '-- layerdirection_query.bash generated --' 1>&2

rm -r $temp

