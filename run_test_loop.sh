#!/bin/bash
while true
do
    kill  $(ps ax | awk '/firelet\/fireletd.py/ {print $1}') 2>/dev/null
    find . -name '*pyc' -delete;
    echo -e '\n\n\n\n\n\n\n\n\n\n\n\n'
    clear
    nosetests test.py
    inotifywait -e MOVE_SELF -e MODIFY *.py firelet/*.py 2>/dev/null
done
