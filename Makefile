.PHONY: build

SHELL := /bin/bash

CONTAINER_NAME=project_wordpress
IMAGE_NAME=project:wordpress

build:
	cp composer.json ./build/composer.json
	docker build -t $(IMAGE_NAME) ./build

start:
	docker-compose up -d wordpress || echo 'Container is already up!'

stop:
	docker-compose stop wordpress

enter:
	docker exec -it $(CONTAINER_NAME) /bin/bash

clean:
	docker-compose down
