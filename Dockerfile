FROM golang:1.19 AS build
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o bot .
FROM debian:buster-sli
WORKDIR /app
COPY --from=build /app/bot /app/
ENV GIN_MODE=release
EXPOSE 8080
CMD ["/app/bot"]
