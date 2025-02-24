FROM golang:1.22 as builder

WORKDIR /healthcheck

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN go build -o healthcheck .

FROM alpine:latest

WORKDIR /app
COPY --from=builder /app/healthcheck .

RUN apk --no-cache add ca-certificates libc6-compat

EXPOSE 8080

CMD ["./healthcheck"]
