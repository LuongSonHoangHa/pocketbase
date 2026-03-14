FROM alpine:latest

ARG PB_VERSION=0.36.5

RUN apk add --no-cache unzip ca-certificates wget

RUN wget https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip \
    && unzip pocketbase_${PB_VERSION}_linux_amd64.zip \
    && rm pocketbase_${PB_VERSION}_linux_amd64.zip

EXPOSE 8090

CMD ["/bin/sh", "-c", "/pocketbase superuser upsert ha@gmail.com 1234567890 --dir=/pb_data && /pocketbase serve --http=0.0.0.0:8090 --dir=/pb_data"]