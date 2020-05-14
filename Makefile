.PHONY: help
SHELL := /usr/bin/env bash

help: ## Print this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
build: ## Build a dockerimage
	docker build -t my-php .
install: ## install dependencies with "composer install"
	docker run --rm -it -v  $(shell pwd):/opt/project my-php composer install
composer: ## run a composer command with an argument arg
	docker run --rm -it -v  $(shell pwd):/opt/project my-php composer $(arg)
phpunit: ## run phpunit test
	docker run --rm -it -v  $(shell pwd):/opt/project my-php ./vendor/bin/phpunit
shell: ## shell inside docker container
	docker run --rm -it -v  $(shell pwd):/opt/project my-php /bin/bash
