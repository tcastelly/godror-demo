FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git build-base
WORKDIR $GOPATH/src/github.com/tcastelly/godror-demo/

COPY . .
RUN go get -d -v
RUN go build -o /go/bin/godror-demo

FROM alpine:latest
ENV LD_LIBRARY_PATH=/lib
RUN wget https://download.oracle.com/otn_software/linux/instantclient/193000/instantclient-basic-linux.x64-19.3.0.0.0dbru.zip && \
    unzip instantclient-basic-linux.x64-19.3.0.0.0dbru.zip && \
    cp -r instantclient_19_3/* /lib && \
    rm -rf instantclient-basic-linux.x64-19.3.0.0.0dbru.zip && \
    apk add libaio && \
    apk add libaio libnsl libc6-compat

COPY script.sh /root/script.sh
RUN /root/script.sh
COPY --from=builder /go/bin/godror-demo /usr/lib/godror-demo
ENTRYPOINT ["/usr/lib/godror-demo"]
