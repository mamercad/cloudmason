FROM ubuntu:18.04
WORKDIR /project
ADD . /project
RUN apt-get update
RUN apt-get -y install python-pip
RUN pip install -r requirements.txt
EXPOSE 10001/tcp
CMD ["python","ambient_weather_exporter.py"]
