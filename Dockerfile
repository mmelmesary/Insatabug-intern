FROM golang:alpine3.18


WORKDIR /app


COPY . /app


RUN go mod download


RUN go build -o app .


EXPOSE 9090


CMD ["./app"]