FROM golang:latest as builder

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY *.go ./

RUN go build -o /docker-newgs-file

EXPOSE 8080

CMD [ "/docker-newgs-file" ]
