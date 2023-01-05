FROM alpine:latest AS builder

RUN set -ex \
    && apk add --no-cache \
        build-base \
        git \
        autoconf \
        automake \
    && cd /tmp \
    && git clone --depth=1 "https://github.com/samhocevar/rinetd" \
    && cd rinetd \
    && ./bootstrap \
    && ./configure --prefix=/usr \
    && make -j $(nproc) \
    && strip rinetd

FROM alpine:latest

COPY --from=builder /tmp/rinetd/rinetd /usr/sbin/rinetd
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
