ARG BASE_VER="3.12"
FROM "andrewzah/base-alpine:$BASE_VER"

RUN apk add bash

ARG HEDGEDOC_RELEASE="1.8.0"
COPY ./install-hedgedoc.sh /tmp/install-hedgedoc.sh

RUN /tmp/install-hedgedoc.sh

COPY ./root/ /
