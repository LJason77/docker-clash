FROM golang:alpine AS builder

RUN apk add --no-cache git

RUN go get -u -v github.com/Dreamacro/clash

RUN wget -Y off -q https://github.com/Dreamacro/maxmind-geoip/releases/latest/download/Country.mmdb

FROM alpine:latest

LABEL maintainer "LJason <https://ljason.cn>"

COPY --from=builder /go/bin/clash /usr/bin/clash
COPY --from=builder /go/Country.mmdb /root/.config/clash/Country.mmdb

RUN apk add --no-cache ca-certificates tzdata && \
    cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    rm -rf /var/cache/apk/*

EXPOSE 1080 8123

CMD ["clash"]
