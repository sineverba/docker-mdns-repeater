#!/bin/bash
# This searches the list of docker networks for the network name in order to get the ID, then (below) uses that ID
# to infer the docker interface name.
DOCKER_INTERFACE=$(docker network list | grep "${DOCKER_NETWORK_NAME}" | awk '{print $1}')
exec mdns-repeater -f ${OPTIONS} "${EXTERNAL_INTERFACE}" "br-${DOCKER_INTERFACE}"