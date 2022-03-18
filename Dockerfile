FROM debian:latest

RUN apt-get update
RUN apt-get upgrade

RUN apt-get install -y build-essential
RUN apt-get install -y flex
RUN apt-get install -y bison
RUN apt-get install -y pmidi
RUN apt-get install -y libasound2-dev
RUN apt-get install -y libasound2
RUN apt-get install -y libx11-dev

RUN apt-get install -y curl unzip
RUN curl -L -o /tmp/rtcmix.zip "https://github.com/RTcmix/RTcmix/archive/refs/tags/v4.3.2.zip"
RUN unzip /tmp/rtcmix.zip

WORKDIR /RTcmix-4.3.2
RUN ./configure --with-alsa
RUN make
RUN make install

ENV PATH="RTcmix-4.3.2/bin:/:${PATH}"
WORKDIR /