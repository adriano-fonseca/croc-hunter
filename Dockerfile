FROM golang:1.6-alpine as builder
MAINTAINER Lachlan Evenson <lachlan.evenson@gmail.com>
ARG VCS_REF
ARG BUILD_DATE

# Metadata
LABEL org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/lachie83/croc-hunter" \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile"

COPY . /go/src/github.com/lachie83/croc-hunter
COPY static/ static/

ENV GIT_SHA $VCS_REF
ENV GOPATH /go
RUN cd $GOPATH/src/github.com/lachie83/croc-hunter && go build .


FROM alpine:latest  
WORKDIR /root/
COPY --from=builder /go/src/github.com/lachie83/croc-hunter .
CMD ["./croc-hunter"]
EXPOSE 8080
