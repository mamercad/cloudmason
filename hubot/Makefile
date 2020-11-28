.PHONY: build
build:
	docker image build -t mamercad/hubot .

.PHONY: push
push: build
	docker push mamercad/hubot

.PHONY: run
run:
	docker run --rm -it -e HUBOT_SLACK_TOKEN='xoxb-redacted' mamercad/hubot
