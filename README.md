# imprint

> A Docker stack for local, headless WordPress development.

## Project structure

```
.
├── bin/
├── config/
├── data/
├── docker/
│   └── Dockerfile
├── logs/
├── src/
│   ├── config/
│   ├── vendor/
│   ├── web/
│   │   ├── content/
│   │   │   └── themes/
│   │   └── wp/
│   ├── composer.json
│   └── wp-cli.yml
├── docker-compose.yml
└── Makefile
```

#### `bin/`

Contains some helpful infrastructure scripts.

#### `config/`

Server config files — `nginx`, `php`, etc. — mapped to their related container
services in `docker-compose.yml`.

#### `data/`

Database dump file is imported from & exported to this dir.

#### `docker/`

Entry point for the custom Docker container.

#### `src/config/`

WordPress environment-specific configuration files.

#### `src/web/`

The webserver root dir. WordPress is installed to `src/web/wp` and development
work is done in `src/web/content`.

#### `src/composer.json`

PHP and WordPress dependencies.

## Initial setup

After cloning the repository, build and start the Docker services:

```sh
# Build the custom container
make build 

# Start the Docker services
make start

# Install Composer dependencies
# @see https://hub.docker.com/_/composer
make install
```

## Acknowledgements

- [Local WordPress Development with Docker and Docker Compose](https://urre.me/writings/docker-for-local-wordpress-development/) for the self-signed certificate scripts and basic compose structure
- [Developing WordPress Sites with Docker](https://dzone.com/articles/developing-wordpress-sites-with-docker) for the database import/export scripts
- [10up/wp-local-docker-v2](https://github.com/10up/wp-local-docker-v2) for other WordPress development features
