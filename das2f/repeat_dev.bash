../make.bash

querydisplay view0 >view0.bash
chmod a+x view0.bash
echo '-- view0.bash generated --'

querydisplay view1 >view1.bash
chmod a+x view1.bash
echo '-- view1.bash generated --'

querydisplay view2 >view2.bash
chmod a+x view2.bash
echo '-- view2.bash generated --'

querydisplay view3 >view3.bash
chmod a+x view3.bash
echo '-- view3.bash generated --'

echo '** running run-fb-pipeline.bash'
./repeat_shell './run-fb-pipeline.bash' './view1.bash'

