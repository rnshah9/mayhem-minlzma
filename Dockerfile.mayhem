FROM --platform=linux/amd64 ubuntu:20.04 as builder

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y clang cmake make

ADD . /minlzma
WORKDIR /minlzma/build
RUN cmake ..
RUN make -j8

RUN mkdir -p /deps
RUN ldd /minlzma/build/minlzdec/minlzdec | tr -s '[:blank:]' '\n' | grep '^/' | xargs -I % sh -c 'cp % /deps;'

FROM ubuntu:20.04 as package

COPY --from=builder /deps /deps
COPY --from=builder /minlzma/build/minlzdec/minlzdec /minlzma/build/minlzdec/minlzdec
ENV LD_LIBRARY_PATH=/deps
