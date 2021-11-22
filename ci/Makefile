SHELL := $(SHELL)

IMAGE := $(IMAGE)
TAG := $(TAG)

CONCOURSE_TARGET := $(CONCOURSE_TARGET)
PIPELINE := $(PIPELINE)
JOB := $(JOB)

.PHONY: all
.DEFAULT_GOAL: help

help: ## Shows this help
	@fgrep -h "##" $(MAKEFILE_LIST) | \
		fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build: ## Build the Docker images
	@docker build -t $(IMAGE):$(TAG) .

push: ## Push the Docker images
	@docker push $(IMAGE):$(TAG)

run: ## Run the (local) Docker image
	@docker run --rm -it $(IMAGE):$(TAG)

validate: ## Validate the pipeline
	@fly --target $(CONCOURSE_TARGET) \
		validate-pipeline \
		--config pipeline.yml

set: ## Set the pipeline
	@fly --target $(CONCOURSE_TARGET) \
		set-pipeline \
		--config pipeline.yml \
		--pipeline $(PIPELINE) \
		--var CONCOURSE_SSH_KEY="${CONCOURSE_SSH_KEY}" \
		--var DOCKER_IO_USERNAME="${DOCKER_IO_USERNAME}" \
		--var DOCKER_IO_PASSWORD="${DOCKER_IO_PASSWORD}" \
		--var SLACK_WEBHOOK="${SLACK_WEBHOOK}" \
		--non-interactive

destroy: ## Destroy the pipeline
	@fly --target $(CONCOURSE_TARGET) \
		destroy-pipeline \
		--pipeline $(PIPELINE) \
		--non-interactive

unpause: ## Unpause the pipeline
	@fly --target $(CONCOURSE_TARGET) \
	unpause-pipeline \
	--pipeline $(PIPELINE)

trigger: ## Launch the pipeline
	@fly --target $(CONCOURSE_TARGET) \
	trigger-job \
	--job $(PIPELINE)/$(JOB) \
	--watch
