FROM ubuntu:18.04

#build steps from https://www.monero.how/tutorial-how-to-mine-monero
RUN apt-get update && apt-get install -y git libcurl4-openssl-dev \
 build-essential libjansson-dev autotools-dev automake
#RUN git clone https://github.com/hyc/cpuminer-multi
RUN git clone https://github.com/SChernykh/cpuminer-multi
RUN cd /cpuminer-multi && ./autogen.sh && ./configure CFLAGS="-march=native" && make
WORKDIR /cpuminer-multi
ENTRYPOINT ["./minerd"]
