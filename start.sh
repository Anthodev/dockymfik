#!/bin/bash

docker-compose -f ./docker-network/docker-compose.yml up -d
docker-compose -f ./docker-app/app/docker-compose.yml up -d
