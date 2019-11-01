#!/bin/bash

docker-compose -f ./docker-network/docker-compose.yml build
docker-compose -f ./docker-app/docker-compose.yml build
