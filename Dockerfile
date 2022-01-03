FROM golang:1.17-alpine as builder

WORKDIR /app

RUN export GO111MODULE=on

COPY . .

RUN go build -o golang-server .


FROM alpine:3.15

WORKDIR /app

COPY --from=builder /app/golang-server .
COPY --from=builder /app/static ./static

EXPOSE 9000

CMD ["/app/golang-server"]