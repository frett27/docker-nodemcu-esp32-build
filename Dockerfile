FROM ubuntu:14.04

RUN apt-get upgrade
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y build-essential
RUN apt-get install -y python
RUN apt-get install -y python-serial
RUN apt-get install -y wget


WORKDIR /opt
RUN wget http://ftp.gnu.org/gnu/make/make-4.0.tar.gz
RUN tar xzfv make-4.0.tar.gz
WORKDIR make-4.0
RUN ./configure
RUN make install

RUN apt-get remove -y make
RUN ln -s /usr/local/bin/make /usr/bin/

WORKDIR /opt
RUN git clone --branch dev-esp32 --recurse-submodules https://github.com/nodemcu/nodemcu-firmware.git nodemcu-firmware-esp32
WORKDIR /opt/nodemcu-firmware-esp32

RUN apt-get install -y libncurses5-dev
RUN apt-get install -y flex bison
RUN apt-get install -y gperf

RUN make




