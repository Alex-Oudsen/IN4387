#!/bin/sh

make tests | grep '^false$' &> /dev/null
if [ $? == 0 ]; then
    echo "A test failed!"
else
    echo "All tests passed"
fi
