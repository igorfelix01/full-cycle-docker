FROM golang:1.20

WORKDIR /usr/src/app

COPY go.mod full-cycle.go ./

RUN go build -o full-cycle .

CMD ./full-cycle
