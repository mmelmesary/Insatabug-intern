FROM golang:1.17.1-alpine3.14


WORKDIR /app


COPY . /app


RUN go mod download


RUN go build -o app .


EXPOSE 8080


CMD ["./app"]