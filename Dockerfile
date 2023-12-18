# docker build -t goPost .
# docker run -it goPost

FROM golang:1.21.5-alpine3.19 AS builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git

RUN mkdir /pro
ADD ./usePost.go /pro/
ADD ./go.mod /pro
WORKDIR /pro
RUN go get -d -v ./...
RUN go build -o server usePost.go

FROM alpine:latest

RUN mkdir /pro
COPY --from=builder /pro/server /pro/server
WORKDIR /pro
CMD ["/pro/server"]