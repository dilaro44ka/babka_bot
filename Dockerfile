FROM golang:1.23.2-alpine
RUN apk add --no-cache \
    libc6-compat
WORKDIR /app

COPY . .

RUN go mod tidy
RUN go build -o bot .

CMD ["./bot"]
