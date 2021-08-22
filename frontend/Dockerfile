FROM golang:latest

WORKDIR /go/src/frontend

COPY . .
RUN go mod download && \
    go build

CMD [ "go", "run", "frontend" ]