#!/bin/bash
set -e

# Set gcc compilation flags
GENERATE_PROFILE="-Ofast -march=native -mtune=native -funroll-loops -flto -fprofile-generate"
COMPILE_WITH_PROFILE="-Ofast -march=native -mtune=native -funroll-loops -flto -fprofile-use"

# Compile the program with -fprofile-generate:
gcc $GENERATE_PROFILE sieve.c -o sieve

# Generate .gcda profiling data:
sieve

# Recompile using the profile data:
gcc $COMPILE_WITH_PROFILE sieve.c -o sieve
