#
# Build HauppaugeUSB
#
FROM ubuntu:16.04

RUN apt-get update

# Note: vim-common is needed for xxd
RUN apt-get install -y libboost-log-dev libboost-program-options-dev \
    libusb-1.0-0-dev build-essential curl git pkg-config \
    vim-common

RUN mkdir /build
WORKDIR /build

CMD /build/build.sh
