VERSION ?= 1.0.0

default: build

clean:
	docker rmi bborbe/mumble:$(VERSION)

build:
	docker build --build-arg VERSION=$(VERSION) --no-cache --rm=true -t bborbe/mumble:$(VERSION) .

run:
	docker run -h example.com -p 64738:64738/tcp bborbe/mumble:$(VERSION)

shell:
	docker run -i -t bborbe/mumble:$(VERSION) /bin/bash

upload:
	docker push bborbe/mumble:$(VERSION)
