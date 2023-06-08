FROM golang:alpine3.18


WORKDIR /app


COPY . /app


RUN go mod download


RUN go build 


EXPOSE 8080


CMD ["./app"]