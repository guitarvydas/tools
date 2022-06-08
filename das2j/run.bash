#!/bin/bash
# this is only an example
# use das2j instead

./build.bash ..

./das2j.bash .. helloworld.drawio >out.json

python3 test.py


