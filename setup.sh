#!/bin/bash

if ! docker network ls | grep -q 'dockymfik-network'; then
    echo "Creating a docker network for this tool"
    docker network create dockymfik-network
    echo "Docker network created"
fi

chmod 600 ./docker-network/acme.json

docker-compose -f ./docker-network/docker-compose.yml build
docker-compose -f ./docker-app/app/docker-compose.yml build
