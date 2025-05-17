
# ================================
# Docker Makefile with Help Menu
# ================================

.PHONY: help build up down rebuild run shell exec-cmd logs clean

# ==== Configurable Variables ====
name ?= ubuntu
file ?= Dockerfile
tag  ?= $(name)
container ?= $(name)

# ==== Help ====
help: ## Show available commands
	@echo ""
	@echo "🛠  Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## ' Makefile | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
	@echo ""

# ==== Build and Compose ====
build: ## Build Docker image with optional file= and tag=
	docker build -f $(file) -t $(tag) .

up: ## Start containers via docker-compose
	docker compose up -d

down: ## Stop and remove docker-compose containers
	docker compose down

rebuild: down build up ## Rebuild image and restart containers

# ==== Run and Shell ====
run: ## Run container interactively and auto-remove after exit
	docker run -it --rm --name $(container) $(tag)

shell: ## Start a bash shell in the running container
	docker exec -it $(container) bash

exec-cmd: ## Run a custom command inside the container (use cmd=...)
	docker exec -it $(container) $(cmd)

# ==== Logs and Cleanup ====
logs: ## Show container logs (follow)
	docker logs -f $(container)

clean: ## Remove build cache, dangling images, and volumes
	docker builder prune -f
	docker image prune -f
	docker volume prune -f

# docker compose down
# docker compose build  # create custom image
# docker builder prune  # clear build data
# docker image prune -f # clear all non-used images
# docker compose up -d  # enable service

# create image
# docker build -f Dockerfile.seleniumbase -t sel_test-seleniumbase-app .
# exec container
# docker run -it --rm --name seleniumbase-container sel_test-seleniumbase-app
# quick cmd for test
# docker exec -it seleniumbase-container chromedriver --version
