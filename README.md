# dockymfik
A complete Symfony-ready development stack using Docker, PHP (with redis support and composer), Node (and Yarn), Let's Encrypt (SSL) and Traefik v2

## Requirements
- Docker
- docker-compose

## Installation
You must install docker first to be able to use this stack. To install it, please refer to this page: https://docs.docker.com/install/

Firstly, please copy/paste the `.env.dist` and edit it with the correct information.
```bash
cp .env.dist .env
```

Out-of-box it's configured to be able to run php application and especially Symfony app. Yet feel free to edit the docker-compose files in `docker-network` and `docker-app` folders to your needs.

Then to setup the stack, run this command:
```bash
sh setup.sh
```

It'll create the docker-network and build the containers.

## Usage

To start the containers, run the following command (in bash it'll work better at the moment):
```bash
sh start.sh
```

To stop the containers, run the following command:
```bash
sh stop.sh
```

## Note
Let's Encrypt is pre-configured to generate a self-signed SSL certificate. Feel free to edit the `docker-compose` of the `docker-network` folder to change this behaviour.

This setup may be used in production (but it's not recommend) if you modify docker-compose files (especially in docker-network folder to disable the Traefik dashboard and tune some settings)
