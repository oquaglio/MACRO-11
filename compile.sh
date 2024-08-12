#!/bin/bash
set -e

OFLAGS="-Ofast -march=native -mtune=native -funroll-loops"

gcc --version
gcc $OFLAGS sieve.c -o sieve