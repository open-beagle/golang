ARG XXBASE=tonistiigi/xx:1.4.0
ARG BASE=golang:1.23-bullseye

FROM ${XXBASE} AS xx
FROM $BASE

ARG AUTHOR=mengkzhaoyun@gmail.com
ARG VERSION=1.23-bullseye
LABEL maintainer=${AUTHOR} version=${VERSION}

COPY --from=xx / /

ENV GOPROXY=https://goproxy.cn
RUN sed -i 's/http\:\/\/deb.debian.org/http\:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
  sed -i 's/http\:\/\/security.debian.org/http\:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
  sed -i 's/http\:\/\/snapshot.debian.org/http\:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
  apt update -y && apt install apt-transport-https ca-certificates -y && \
  sed -i 's/http\:\/\/mirrors.tuna.tsinghua.edu.cn/https\:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
  apt update -y && \
  apt install -y rsync pkg-config build-essential sudo
