#!/bin/bash
grep FATAL <fb.pl
if grep -q FATAL <fb.pl
then
    echo quitting
    exit 1
fi
