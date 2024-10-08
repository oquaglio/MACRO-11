#!/bin/bash
set -e

for info in "model name" "cpu MHz" "cache size"
do
    grep -m1 "$info" /proc/cpuinfo
done

exec ./sieve "$@"