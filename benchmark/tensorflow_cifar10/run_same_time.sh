#!/bin/bash

TIMES=$1

if [ -z $1 ]; then
    echo "arg1 as times"
    exit
fi

for ((i = 0 ; i < $1 ; i++)); do
    python3 cifar10.py &
done
