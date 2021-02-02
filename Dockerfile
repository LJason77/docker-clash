FROM golang:alpine AS builder

RUN apk add -q --no-cache git

RUN go get -u -v github.com/Dreamacro/clash

FROM alpine:latest

LABEL maintainer "LJason <https://ljason.cn>"

COPY --from=builder /go/bin/clash /usr/bin/clash

ADD https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb /root/.config/clash/Country.mmdb

RUN apk add -q --no-cache ca-certificates tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    rm -rf /var/cache/apk/*

EXPOSE 1080 8123

CMD ["clash"]
