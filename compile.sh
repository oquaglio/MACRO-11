#!/bin/bash
set -e

OFLAGS="-Ofast -march=native -mtune=native -funroll-loops -flto -fprofile-generate -fprofile-use"

gcc --version
gcc $OFLAGS sieve.c -o sieve