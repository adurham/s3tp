FROM golang

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

COPY . /go/src/app

RUN \
  go get -u github.com/golang/dep/cmd/dep && \
  go get -u -d github.com/mattes/migrate/cli github.com/lib/pq && \
  go build -tags 'postgres' -o /usr/local/bin/migrate github.com/mattes/migrate/cli && \
  dep ensure

CMD ["go", "test", "-v"]
