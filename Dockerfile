FROM ubuntu:18.04

COPY . /

RUN apt-get update && apt-get install -y golang-go nginx

RUN go build -o ecommerce main.go

WORKDIR /randomfolder

COPY ecommerce /app/ecommerce

EXPOSE 80

CMD ["/app/ecommerce"]
