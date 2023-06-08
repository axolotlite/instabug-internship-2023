#build container
FROM golang:1.20.4-alpine3.18 AS build
ARG CGO_ENABLED=0
WORKDIR /usr/src/build
COPY . .
RUN go install
RUN go build -o app .

# actual container
FROM alpine:3.14.10
COPY --from=build /usr/src/build/app /usr/bin
EXPOSE 9090
CMD ["app"]