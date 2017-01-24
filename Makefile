VERSION ?= latest
REGISTRY ?= docker.io

default: build

clean:
	docker rmi $(REGISTRY)/bborbe/mumble:$(VERSION)

build:
	docker build --build-arg VERSION=$(VERSION) --no-cache --rm=true -t $(REGISTRY)/bborbe/mumble:$(VERSION) .

run:
	docker run \
	-p 64738:64738/tcp \
	$(REGISTRY)/bborbe/mumble:$(VERSION)

shell:
	docker run -i -t $(REGISTRY)/bborbe/mumble:$(VERSION) /bin/bash

upload:
	docker push $(REGISTRY)/bborbe/mumble:$(VERSION)
