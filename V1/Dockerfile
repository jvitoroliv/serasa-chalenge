FROM golang:alpine

WORKDIR /app
COPY . /app

ENV GO111MODULE=auto

RUN go build -o main .

CMD ["/app/main"]
