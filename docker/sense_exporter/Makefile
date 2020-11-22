.PHONY: build
build:
	docker image build -t mamercad/sense_exporter .

.PHONY: push
push:
	docker push mamercad/sense_exporter

.PHONY: run
run:
	docker run --rm -it -p 10000:10000/tcp -e SENSE_USERNAME="${SENSE_USERNAME}" -e SENSE_PASSWORD="${SENSE_PASSWORD}" sense_exporter .
