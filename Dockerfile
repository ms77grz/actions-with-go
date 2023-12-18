# docker build -t goPost .
# docker run -it goPost

FROM golang:latest AS builder

# Install git.
# Git is required for fetching the dependencies.
RUN apt update && apt add --no-cache git

RUN mkdir /pro
ADD ./usePost.go /pro/
WORKDIR /pro
RUN go get -d -v ./...
RUN go build -o server usePost.go

FROM alpine:latest

RUN mkdir /pro
COPY --from=builder /pro/server /pro/server
WORKDIR /pro
CMD ["/pro/server"]