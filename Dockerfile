ARG ALPINE_VERSION
FROM andrewzah/base-alpine:$ALPINE_VERSION

RUN apk add bash

ARG HEDGEDOC_VERSION
COPY ./install-hedgedoc.sh /tmp/install-hedgedoc.sh

RUN /tmp/install-hedgedoc.sh

COPY ./root/ /
