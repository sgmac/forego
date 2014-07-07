BIN = forego
SRC = $(shell ls *.go)
VERSION = dev

all: build

build: $(BIN)

clean:
	rm -f $(BIN)

install: forego
	cp $< ${GOPATH}/bin/

lint: $(SRC)
	go fmt

$(BIN): $(SRC)
	godep get
	godep go build -ldflags "-X main.Version ${VERSION}" -o $@
