#!/usr/bin/env zsh
echo "Building new kernel..."
make
echo "Running vm with target kernel..."
qemu-system-i386 -kernel myos
