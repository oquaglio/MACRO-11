#

Build image:

>docker build -t sieve .

Run image with args for sieve bin:

>docker run sieve -l 1000 -s 60

More examples..

How many times can we eval 1st 1,000,000 primes in 5s?

>docker run sieve -l 1000000 -s 5
