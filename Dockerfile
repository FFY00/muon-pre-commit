FROM alpine:latest

RUN apk add git musl libarchive libarchive-dev libcurl curl-dev pkgconf pkgconf-dev samurai

RUN git clone https://git.sr.ht/~lattis/muon
WORKDIR muon

RUN ./bootstrap.sh build
RUN build/muon setup builddir
RUN samu -C builddir
RUN build/muon -C builddir install
