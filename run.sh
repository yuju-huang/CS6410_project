#!/bin/bash

#QEMU=qemu-system-x86_64
QEMU=/home/gic4107/qemu/build/x86_64-softmmu/qemu-system-x86_64
DISK=/mnt/fba5f8a8-9c20-4e9c-959b-c995ffecb9db/Cornell/Course/2019_fall/Advanced_Systems_6410/final_project/ubuntu.disk

if [ -z $1 ] || [ -z $2 ] || [ -z $3 ] || [ -z $4 ]; then                                                                  
    echo "arg1 as local memory size (MB); arg2 as network delay (us); arg3 as # of cores; arg4 as memory size"
    exit                                                                            
fi   

$QEMU \
    -enable-kvm \
    -m $4 \
    -hda $DISK \
    -smp $3 \
    -net nic,model=virtio \
    -net user,hostfwd=tcp::2222-:22,hostfwd=tcp::4444-:11211 \
    -cpu host \
    -dsag-sim -dsag-local-mem-size $1 \
    -dsag-network-delay $2 \
    -s
    #-append 'kgdbwait kgdboc=ttyS0,115200' \
    #-serial tcp::1234,server,nowait \
    #-cdrom $3
