.PHONY: all test build test_coverage

build:
	go get
	go get gopkg.in/mgo.v2
	go get github.com/onsi/ginkgo/ginkgo
	go get github.com/onsi/gomega

test:
	ginkgo tests

run:
	go run main.go

test_coverage:
	@go get github.com/modocache/gover
	@go get github.com/mattn/goveralls
	@ginkgo -cover -coverpkg=./... tests
	@gover
	@mv gover.coverprofile coverage.txt
