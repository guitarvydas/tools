#!/bin/bash
clear
app=../
${app}/make.bash
#prep '.' '$' designrule.ohm designrule.glue --stop=1 --trace --view <designrule-edgecontainment.md
prep '.' '$' designrule.ohm designrule.glue --stop=1 <designrule-edgecontainment.md >_temp
(                          sed -E -e 's/^[ ]+//g' | sed -E -e '/^[ ]*$/d') <_temp >temp2
(sed -E -e 's/\%\%.*$//' | sed -E -e 's/^[ ]+//g' | sed -E -e '/^[ ]*$/d') <designrule-edgecontainment.md >temp3
diff -w temp2 temp3


