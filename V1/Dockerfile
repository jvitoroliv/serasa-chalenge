FROM golang

WORKDIR /go/src/app

ADD . .

ENV GO111MODULE=auto

RUN go build -o /webapp

CMD [ "/webapp" ]
