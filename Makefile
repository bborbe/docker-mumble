default: build

clean:
	docker rmi bborbe/mumble

build:
	docker build --no-cache --rm=true -t bborbe/mumble .

run:
	docker run -h example.com -p 64738:64738/tcp bborbe/mumble:latest

shell:
	docker run -i -t bborbe/mumble:latest /bin/bash

upload:
	docker push bborbe/mumble
