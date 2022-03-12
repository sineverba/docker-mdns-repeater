IMAGE_NAME=sineverba/mdsn-repeater
CONTAINER_NAME=mdsn-repeater
VERSION=0.9.0

build:
	docker build --tag $(IMAGE_NAME):$(VERSION) .

test:
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION) cat /proc/version | grep "Linux version 5.13.0-30-generic"
	
destroy:
	docker image rm $(IMAGE_NAME):$(VERSION)