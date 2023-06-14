FROM golang:alpine3.18

RUN addgroup go-group && adduser -D -G go-group go-user

WORKDIR /app


COPY ./app /app


RUN go mod download


RUN go build -o app .


EXPOSE 9090

USER go-user

CMD ["./app"]