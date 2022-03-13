Docker mDNS repeater
====================

> Docker image to enable mDNS for other containers without setting `net=host` for them

I use it for HomeAssistant (to not use `network=host` mode).

| CI / CD | Status |
| ------- | ------ |
| Semaphore | [![Build Status](https://sineverba.semaphoreci.com/badges/docker-mdsn-repeater/branches/master.svg)](https://sineverba.semaphoreci.com/projects/docker-mdsn-repeater) |

## How to use
+ Add this image `sineverba/mdsn-repeater:1.0.0` to your `docker-compose.yaml` file
+ Pass as environments:
    + `EXTERNAL_INTERFACE`: the physical interface
    + `DOCKER_NETWORK_NAME`: the Docker network name of __other__ container to pass the mDSN repeater

## docker-compose.yml example

```yaml
version: "3.8"
services:
  homeassistant:
    container_name: homeassistant
    image: homeassistant/home-assistant:2022.3.3
    volumes:
      - ./config:/config
      - /etc/localtime:/etc/localtime:ro
    ports:
      - "8123:8123"
    networks:
      - homeassistant

  mdns_repeater:
    container_name: mdns_repeater
    image: sineverba/mdsn-repeater:1.0.0
    network_mode: "host"
    privileged: true
    environment:
      - EXTERNAL_INTERFACE=wlp0s20f3
      - DOCKER_NETWORK_NAME=homeassistant
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock


networks:
  homeassistant:
    name: homeassistant
    driver: bridge
```


## Available architectures

+ linux/arm64/v8
+ linux/amd64
+ linux/arm/v6
+ linux/arm/v7



## Credits

Forked from `cchengleo/mdns_repeater-docker`

mdns-repeater.c was obtained from [kennylevinsen's fork](https://github.com/kennylevinsen/mdns-repeater) of [Darell Tan's](https://bitbucket.org/geekman/mdns-repeater) mdns-repeater.c

The original dockerization of mdns-repeater was done by [angelnu](https://github.com/angelnu/docker-mdns_repeater) 

Licensing is GPLv2 as inherited from Darell Tan's mdns-repeater.c.
