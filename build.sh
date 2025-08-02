#!/usr/bin/env bash
crystal build --release img.cr -o crystalimg
clang -O3 -o clangimg img.c
clang -O3 -o clangimg-mc img_multicasting.c
gcc -O2 -o gccimg img.c
gcc -O2 -o gccimg-mc img_multicasting.c
