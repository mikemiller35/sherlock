.PHONY: build
build:
	go build -ldflags "-X github.com/ch0ppy35/sherlock/cmd.version=LOCALBUILD \
	-X github.com/ch0ppy35/sherlock/cmd.commit=mainline \
	-X github.com/ch0ppy35/sherlock/cmd.date=$$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
	-X github.com/ch0ppy35/sherlock/cmd.arch=$$(go env GOARCH) \
	-X github.com/ch0ppy35/sherlock/cmd.goversion=$$(go version | awk '{print $$3}')" \
	-o bin/sherlock .

.PHONY: clean
clean:
	rm -rf bin/
	rm -rf dist/

.PHONY: clean-cache
clean-cache:
	go clean -testcache

.PHONY: docker-build
docker-build:
	docker build -t ghcr.io/ch0ppy35/sherlock:latest .

.PHONY: test
test:
	go test ./... -cover
