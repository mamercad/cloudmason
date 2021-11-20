IMAGE := foo
VERSION := 0.0.1
CONCOURSE_TARGET := cloudmason
PIPELINE := cloudmason
JOB := job

.PHONY: all
.DEFAULT_GOAL: help

help: ## Shows this help
	@fgrep -h "##" $(MAKEFILE_LIST) | \
		fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

build: ## Build the Docker images
	@docker build -t $(IMAGE):$(shell cat VERSION) .
	@docker tag $(IMAGE):$(shell cat VERSION) $(IMAGE):latest

push: ## Push the Docker images
	@docker push $(IMAGE):$(shell cat VERSION)
	@docker push $(IMAGE):latest

run: ## Run the (local) Docker image
	@docker run --rm -it $(IMAGE):$(shell cat VERSION)

validate: ## Validate the pipeline
	@fly --target $(CONCOURSE_TARGET) \
		validate-pipeline \
		--config pipeline.yml
# var SLACK_BOT_TOKEN=$(SLACK_BOT_TOKEN) \
# var SLACK_CHANNEL=$(SLACK_CHANNEL)

set: ## Set the pipeline
	@fly --target $(CONCOURSE_TARGET) \
		set-pipeline \
		--config pipeline.yml \
		--pipeline $(PIPELINE) \
		--non-interactive

#		--var SLACK_BOT_TOKEN=$(SLACK_BOT_TOKEN) \
#		--var SLACK_CHANNEL=$(SLACK_CHANNEL)

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

# shipit: build push set launch ## Build, push, set and launch
# 	@echo shipit
