ARG VERSION=${VERSION:-[VERSION]}

FROM alpine:3.17

ARG VERSION

# apk
COPY ./install-packages.sh /usr/local/bin/install-packages
RUN apk update && apk add bash bc \
  && INSTALL_VERSION=$VERSION install-packages \
  && rm /usr/local/bin/install-packages;

COPY ./docker/speedtest.py /usr/local/bin/speedtest
ENTRYPOINT ["speedtest"]
