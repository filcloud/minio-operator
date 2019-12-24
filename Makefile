PWD := $(shell pwd)
VERSION ?= $(shell git describe --tags)
TAG ?= "minio/k8s-operator:$(VERSION)"
LDFLAGS ?= "-s -w -X main.Version=$(VERSION)"

all: build

verify: govet gotest

generate:
	@$(GOPATH)/src/k8s.io/code-generator/generate-groups.sh all github.com/minio/minio-operator/pkg/client github.com/minio/minio-operator/pkg/apis miniocontroller:v1beta1

build:
	@CGO_ENABLED=0 go build --ldflags $(LDFLAGS) -o $(PWD)/minio-operator
	@docker build -t $(TAG) .

install: all
	@docker push $(TAG)

govet:
	@CGO_ENABLED=0 go vet ./...

gotest:
	@go test -race ./...
