FROM golang:1.13 AS build-env
ADD . /go/src/app
WORKDIR /go/src/app
RUN go env -w GO111MODULE=on && go env -w GOPROXY=https://goproxy.cn,direct
RUN GOOS=linux GOARCH=386 go build -v -o /go/src/app/app-server

FROM alpine
COPY --from=build-env /go/src/app/app-server /usr/local/bin/app-server
EXPOSE 8080
CMD [ "app-server" ]