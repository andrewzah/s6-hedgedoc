#!/bin/bash

set -eux

echo "**** install build packages ****"
apk add --update --no-cache --virtual .build-deps \
  build-base \
  git \
  gnupg \
  jq \
  curl \
  icu-dev \
  openssl-dev

echo "**** install runtime *****"
apk add --update --no-cache \
  fontconfig \
  font-noto \
  netcat-openbsd \
  nodejs \
  yarn

echo "**** install hedgedoc ****"
curl -o \
  /tmp/hedgedoc.tar.gz -L \
  "https://github.com/hedgedoc/hedgedoc/releases/download/${HEDGEDOC_RELEASE}/hedgedoc-${HEDGEDOC_RELEASE}.tar.gz"

mkdir -p /opt/hedgedoc
tar xf /tmp/hedgedoc.tar.gz -C \
  /opt/hedgedoc --strip-components=1

cd /opt/hedgedoc
bin/setup

echo "**** cleanup ****"
yarn cache clean
apk del .build-deps

rm -rf \
  /tmp/* \
  /var/lib/apt/lists/* \
  /var/tmp/*
