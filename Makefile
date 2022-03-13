IMAGE_NAME=sineverba/mdsn-repeater
CONTAINER_NAME=mdsn-repeater
VERSION=0.1.0

build:
	docker build --tag $(IMAGE_NAME):$(VERSION) .

test:
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION) cat /etc/os-release | grep "Alpine Linux"
	docker run --rm -it --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION) cat /etc/os-release | grep "3.15.0"
	
destroy:
	docker image rm $(IMAGE_NAME):$(VERSION)