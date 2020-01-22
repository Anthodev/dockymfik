#!/bin/bash

set -a

source .env

docker-compose -f ./docker-network/docker-compose.yml up -d
docker-compose -f ./docker-app/docker-compose.yml up -d
