#!/bin/bash

docker-compose -f ./docker-network/docker-compose.yml down
docker-compose -f ./docker-app/app/docker-compose.yml down
