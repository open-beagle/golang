ARG XXBASE=tonistiigi/xx:1.4.0
ARG BASE=golang:1.23-bullseye

FROM ${XXBASE} AS xx
FROM $BASE

ARG AUTHOR=mengkzhaoyun@gmail.com
ARG VERSION=1.23-bullseye
LABEL maintainer=${AUTHOR} version=${VERSION}

COPY --from=xx / /

ENV GOPROXY=https://goproxy.cn
RUN apt update && \
  apt install -y apt-transport-https ca-certificates && \
  apt install -y rsync pkg-config sudo build-essential crossbuild-essential-arm64
