DOCKER_CMD := docker-compose -f docker-compose.yml
CONTAINER_CMD := docker exec -it vlc-boxed-env

_:

build:
	${DOCKER_CMD} build

up:
	${DOCKER_CMD} up -d

down:
	${DOCKER_CMD} down

connect:
	${CONTAINER_CMD} bash

http-stream:
	docker exec -t vlc-boxed-env bash http-stream.sh
