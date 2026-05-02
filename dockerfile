FROM alpine:3.20

RUN apk add --no-cache \
    bash \
    coreutils \
    procps

WORKDIR /app

COPY . .

RUN chmod +x *.sh

CMD ["./scrpt_run_all.sh"]