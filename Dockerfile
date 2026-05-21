FROM golang:1.22 AS builder

WORKDIR /app

COPY . .

RUN go build -o main main.go

FROM ubuntu:latest

WORKDIR /app

COPY --from=builder /app/main .

RUN chmod +x ./main

EXPOSE 8000

ENTRYPOINT ["./main"]