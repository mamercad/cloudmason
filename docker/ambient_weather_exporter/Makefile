.PHONY: build
build:
	docker image build -t mamercad/ambient_weather_exporter .

.PHONY: push
push:
	docker push mamercad/ambient_weather_exporter

.PHONY: run
run:
	docker run --rm -it -p 10001:10001/tcp -e AMBI_APP_KEY="${AMBI_APP_KEY}" -e AMBI_API_KEY="${AMBI_API_KEY}" ambient_weather_exporter .
