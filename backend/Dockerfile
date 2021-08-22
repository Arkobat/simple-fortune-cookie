FROM golang:latest

WORKDIR /go/src/backend

COPY . .
RUN go mod download && \
    go build

CMD [ "go", "run", "backend" ]