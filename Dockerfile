FROM alpine:latest AS builder

RUN set -ex \
    && apk add --no-cache \
        build-base \
        git \
        autoconf \
        automake \
    && cd /tmp \
    && git clone "https://github.com/samhocevar/rinetd" \
    && cd rinetd \
    && ./bootstrap \
    && ./configure --prefix=/usr \
    && make

FROM alpine:latest

COPY --from=builder /tmp/rinetd/rinetd /usr/sbin/rinetd
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh
