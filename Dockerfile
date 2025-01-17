# build
FROM golang:1.17 as builder

WORKDIR /go/src

COPY . /go/src/

RUN CGO_ENABLED=0 go build -a -o kamailio_exporter

# run
FROM scratch
COPY --from=builder /go/src/kamailio_exporter /kamailio_exporter

LABEL author="Florent CHAUVEAU <florent.chauveau@gmail.com>"

EXPOSE 9494

ENTRYPOINT [ "/kamailio_exporter" ]
