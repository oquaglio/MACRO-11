# Stage 1: Build Stage
FROM ubuntu:20.04 AS build

RUN apt-get update && apt-get -y install gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/primes

COPY . .

# Rename file (gcc fails if all caps)
RUN mv SIEVE.C sieve.c

# Make scripts executable and compile the program
RUN chmod +x ./compile.sh ./run.sh \
    && ./compile.sh

# Stage 2: Final Image
FROM ubuntu:20.04

WORKDIR /home/primes

# Copy the compiled binary and necessary scripts from the build stage
COPY --from=build /home/primes/sieve /home/primes/run.sh .

# Set the entrypoint to run the script with default args
ENTRYPOINT [ "./run.sh" ]
CMD ["-l", "1000", "-s", "20"]
