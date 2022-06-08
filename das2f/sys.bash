baton=baton_${RANDOM}
rm -f ${baton} && mkfifo ${baton}
# sender
while true
do
    ./run.bash
    sendUpdated >${baton}
done


# receivers
(while read baton ; do ./view1 ; done) <${baton}
(while read baton ; do ./view2 ; done) <${baton}
