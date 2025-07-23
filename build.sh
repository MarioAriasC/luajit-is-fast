#!/usr/bin/env bash
crystal build --release img.cr -o crystalimg
clang -O3 -o clangimg img.c
clang -O3 -o clangimg-mc img_multicasting.c
