#!/bin/bash

docker-compose -f ./docker-network/docker-compose.yml stop
docker-compose -f ./docker-app/app/docker-compose.yml stop
