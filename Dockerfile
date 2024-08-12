FROM ubuntu:20.04

RUN apt-get update && apt-get -y install gcc \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/primes

COPY . .

RUN mv SIEVE.C sieve.c

RUN chmod +x ./compile.sh
RUN chmod +x ./run.sh

RUN ./compile.sh

ENTRYPOINT [ "./run.sh" ]
#ENTRYPOINT [ "./sieve" ]

# default args
CMD ["-l", "1000", "-s", "20"]

