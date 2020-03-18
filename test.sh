#!/bin/bash

#QEMU=qemu-system-x86_64
QEMU=/home/gic4107/qemu/build/x86_64-softmmu/qemu-system-x86_64
KERNEL=/home/gic4107/linux/arch/x86/boot/bzImage
IMAGE=/mnt/fba5f8a8-9c20-4e9c-959b-c995ffecb9db/Cornell/Course/2019_fall/Advanced_Systems_6410/final_project/ubuntu.disk

$QEMU \
  -hda $IMAGE \
  -m 512 \
  --enable-kvm \
  -cpu host \
  -s \
#  -append "console=ttyS0" \
#  -append nokaslr \
#  -kernel $KERNEL \
#  -nographic \
#  -s -S \
