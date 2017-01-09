.PHONY: tests services 

help: ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

up: ## Run the application services
	docker-compose -f docker-compose-dev.yml up -d

