# generate queries
#
# usage: ./make.bash <tools-root>

root=$1

here=`pwd`
temp=temp_${RANDOM}

qd3=$here/qd3/querydisplay3.bash
sqd=$here/setquerydisplay/setquerydisplay.bash
prep=$root/prep/prep

$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue --support=$here/implicitforall.support.js <layerallcontains.md >preprocessed_layerallcontains.md
$qd3 $root $here/qd3  preprocessed_layerallcontains --prefix="$here/" >layerallcontains_query.bash
chmod a+x layerallcontains_query.bash
echo '-- layerallcontains_query.bash generated --' 1>&2

$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js <contains_port.md >preprocessed_contains_port.md
$qd3 $root $here/qd3   preprocessed_contains_port  --prefix="$here/" >layer4_query.bash
chmod a+x layer4_query.bash
echo '-- layer4_query.bash generated --' 1>&2

$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js <indirect_contains.md >preprocessed_indirect_contains.md
$qd3 $root $here/qd3   preprocessed_indirect_contains  --prefix="$here/" >layer5_query.bash
chmod a+x layer5_query.bash
echo '-- layer5_query.bash generated --' 1>&2

$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js <direct_contains.md >preprocessed_direct_contains.md
$sqd $root $here/setquerydisplay preprocessed_direct_contains  --prefix="$here/" >layer6_query.bash
chmod a+x layer6_query.bash
echo '-- layer6_query.bash generated --' 1>&2


$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js <contains_edge1.md >preprocessed_contains_edge1.md
$qd3 $root $here/qd3    preprocessed_contains_edge1 --prefix="$here/" >layeredgecontainment1_query.bash
chmod a+x layeredgecontainment1_query.bash
echo '-- layeredgecontainment1_query.bash generated --' 1>&2
$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js <contains_edge2.md >preprocessed_contains_edge2.md
$qd3 $root $here/qd3    preprocessed_contains_edge2 --prefix="$here/" >layeredgecontainment2_query.bash
chmod a+x layeredgecontainment2_query.bash
echo '-- layeredgecontainment2_query.bash generated --' 1>&2
$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js <contains_edge3.md >preprocessed_contains_edge3.md
$qd3 $root $here/qd3    preprocessed_contains_edge3 --prefix="$here/" >layeredgecontainment3_query.bash
chmod a+x layeredgecontainment3_query.bash
echo '-- layeredgecontainment3_query.bash generated --' 1>&2


$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue <synccode.md >preprocessed_synccode.md
$qd3 $root $here/qd3   preprocessed_synccode --prefix="$here/"  >layersynccode_query.bash
chmod a+x layersynccode_query.bash
echo '-- layersynccode_query.bash generated --' 1>&2

$prep '#+ query ' '#+ ' implicitforall.ohm implicitforall.glue  --support=$here/implicitforall.support.js <connection.md >preprocessed_connection.md
$qd3 $root $here/qd3   preprocessed_connection --prefix="$here/"  >layerconnection_query.bash
chmod a+x layerconnection_query.bash
echo '-- layerconnection_query.bash generated --' 1>&2

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

temp=temp_${RANDOM}

plpath=./
dr=${root}/dr
mdfile=${dr}/dr-edgecontainment.md
fname=`basename -s '.md' $mdfile`
$prep "cond\n" "endcond\n" ${dr}/cond.ohm ${dr}/cond.glue --inclusive --stop=1 --support=${dr}/drsupport.js <$mdfile >$temp
$prep "." "$" ${dr}/designrule.ohm ${dr}/designrulea.glue --stop=1 --support=${dr}/drsupport.js --PLPATH=$plpath<$temp >a-$fname
$prep "." "$" ${dr}/designrule.ohm ${dr}/designruleb.glue --stop=1 --support=${dr}/drsupport.js <$mdfile >b-$fname
chmod a+x a-$fname
chmod a+x b-$fname
echo '-- ' "design rules a-${fname} and b-${fname} generated" ' --' 1>&2




baton1=baton
rm -f ${baton1} && mkfifo ${baton1}
rm -r $temp

