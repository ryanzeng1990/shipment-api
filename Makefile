.PHONY: *

help: ## This help dialog.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2 | "sort -u"}' $(MAKEFILE_LIST)

up: ## It will start the containers
	docker compose up -d

build: ## It will build the containers and start them
	docker compose up --build -d

down: ## It will stop the containers
	docker compose down

tests: unit-tests functional-tests ## Run tests

unit-tests: ## Run Unit tests
	docker compose run --rm php ./vendor/bin/phpunit --testsuite Unit

functional-tests: ## Run Functional tests
	docker compose run --rm php ./vendor/bin/phpunit --testsuite Functional

integration-tests: ## Run Integration tests
	docker compose run --rm php ./vendor/bin/phpunit --testsuite Integration

phpstan: ## Run PHPStan checks
	docker compose run --rm php ./vendor/bin/phpstan analyse --memory-limit 1G

phpcs: ## Run PHPCs checks
	docker compose run --rm php ./vendor/bin/phpcs --config-set show_warnings 0

lint: ## Run PHPCs checks
	docker compose run --rm php ./vendor/bin/phpcbf

code-coverage: ## Run PHPUnit Test (Unit + Functional) + code coverage
	docker compose run -e XDEBUG_MODE=coverage --rm php ./vendor/bin/phpunit --coverage-html ./tests/Coverage --testsuite Unit,Feature

tests-coverage-txt: ## Run PHPUnit Test (Unit + Functional) + code coverage
	docker compose run -e XDEBUG_MODE=coverage --rm php ./vendor/bin/phpunit --coverage-text --testsuite Unit,Feature

validations: phpstan phpcs lint ## Run PHPStan + PHPCs checks

migration-up: ## Run Migrations
	docker compose run --rm php php artisan migrate
