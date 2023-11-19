FROM golang:alpine as builder
WORKDIR /app
RUN go mod init fullcycle
COPY main.go .
RUN go build -o main .

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .
CMD ["./main"]