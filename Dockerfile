FROM golang:alpine AS builder
RUN apk update && apk add --no-cache git build-base
WORKDIR $GOPATH/src/github.com/tcastelly/godror-demo/

COPY . .
RUN go get -d -v
RUN go build -o /go/bin/godror-demo


FROM oraclelinux:7-slim
ARG release=19
ARG update=6
RUN  yum -y install oracle-release-el7 && yum-config-manager --enable ol7_oracle_instantclient && \
     yum -y install oracle-instantclient${release}.${update}-basic oracle-instantclient${release}.${update}-devel oracle-instantclient${release}.${update}-sqlplus && \
     rm -rf /var/cache/yum
COPY --from=builder /go/bin/godror-demo /go/bin/godror-demo
# ENTRYPOINT ["/go/bin/godror-demo"]
