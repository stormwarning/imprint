.PHONY: build

SHELL := /bin/bash

CONTAINER_NAME = project-wordpress
# IMAGE_NAME = docker.pkg.github.com/OWNER/REPOSITORY/project:wordpress
IMAGE_NAME = project:wordpress

build:
	docker build -t $(IMAGE_NAME) ./docker

start:
	docker-compose up -d || echo 'Container is already up!'

install:
    docker run --rm --interactive --tty --volume $PWD/src:/app composer install

stop:
	docker-compose stop

enter:
	docker exec -it $(CONTAINER_NAME) /bin/bash

clean:
	docker-compose down

push:
    docker push $(IMAGE_NAME)
