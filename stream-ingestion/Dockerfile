FROM golang:1.15.5

ADD . /usr/src/app
WORKDIR /usr/src/app

RUN go build -o send-messages
ENTRYPOINT [ "/usr/src/app/send-messages" ]
