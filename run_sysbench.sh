#!/bin/bash

BLOCK_SIZE=$1
TOTAL_SIZE=$2
TIME=$3

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ]; then
    echo "arg1 as block size; arg2 as total size; arg3 as time"
    exit
fi

sysbench --test=memory --memory-block-size=$BLOCK_SIZE --memory-total-size=$TOTAL_SIZE --memory-access-mode=rnd --time=$TIME run
