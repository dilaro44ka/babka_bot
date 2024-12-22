FROM golang:1.23.2 AS builder

WORKDIR /app
ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
COPY go.mod go.sum ./

RUN go mod tidy

COPY . .

RUN go build -o bot .

FROM debian:buster-slim

WORKDIR /app

COPY --from=builder /app/bot /app/

CMD ["/app/bot"]
