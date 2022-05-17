FROM --platform=linux/amd64 ubuntu:20.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y clang cmake make

ADD . /minlzma
WORKDIR /minlzma/build
RUN cmake ..
RUN make -j8
