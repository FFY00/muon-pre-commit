FROM alpine:latest

RUN apk add git gcc musl musl-dev libarchive libarchive-dev libcurl curl-dev pkgconf pkgconf-dev samurai

RUN git clone https://git.sr.ht/~lattis/muon
WORKDIR muon
RUN git checkout c6207ca1

RUN ./bootstrap.sh build
RUN build/muon setup builddir
RUN samu -C builddir
RUN build/muon -C builddir install
