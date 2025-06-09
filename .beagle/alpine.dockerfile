ARG XXBASE=tonistiigi/xx:1.4.0
ARG BASE=golang:1.23-alpine

FROM ${XXBASE} AS xx
FROM ${BASE}

ARG AUTHOR=mengkzhaoyun@gmail.com
ARG VERSION=1.23-alpine
LABEL maintainer=${AUTHOR} version=${VERSION}

COPY --from=xx / /

ENV GOPROXY=https://goproxy.cn
RUN apk update && \
  apk --no-cache --update add bash curl tzdata alpine-sdk linux-headers && \
  sed -i "s@dl-cdn.alpinelinux.org@mirrors.aliyun.com@g" /etc/apk/repositories && \
  apk update && \
  rm -rf /var/cache/apk/*