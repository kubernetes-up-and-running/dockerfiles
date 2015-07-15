FROM alpine
MAINTAINER Kelsey Hightower <kelsey.hightower@kuar.io>
RUN apk --update add \
    bash \
    bzr \
    ca-certificates \ 
    gcc \
    go \
    git \
    linux-headers \
    mercurial \
    musl-dev \
    openssh-client \
    rsync \
    subversion
RUN mkdir -p /go/src /go/bin && chmod -R 777 /go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
RUN go get golang.org/x/tools/cmd/cover github.com/tools/godep
WORKDIR /go
