FROM golang:1.20 as builder


RUN mkdir -p /app
WORKDIR /app

COPY go.mod .
COPY full-cycle.go .

ENV GOPROXY https://proxy.golang.org,direct

RUN go mod download

COPY . .

ENV CGO_ENABLED=0

RUN GOOS=linux go build ./full-cycle.go

FROM scratch

WORKDIR /app

COPY --from=builder /app/full-cycle .

CMD ["/app/full-cycle"]
