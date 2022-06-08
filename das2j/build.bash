# generate queries
#
# usage: ./build.bash <tools-root>


root=$1

here=`pwd`
temp=temp_${RANDOM}

das2fdir=$root/das2f
qd3=$das2fdir/qd3/querydisplay3.bash
sqd=$das2fdir/setquerydisplay/setquerydisplay.bash
prep=$root/prep/prep


$prep '#+ query ' '#+ ' ${das2fdir}/implicitforall.ohm ${das2fdir}/implicitforall.glue --support=${das2fdir}/implicitforall.support.js <component.md >preprocessed_layercomponent.md
$qd3 $root $das2fdir/qd3 preprocessed_layercomponent --prefix="${here}/" >layercomponent_query.bash
chmod a+x layercomponent_query.bash
echo '-- layercomponent_query.bash generated --' 1>&2
