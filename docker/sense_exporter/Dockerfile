FROM ubuntu:18.04
WORKDIR /project
ADD . /project
RUN apt-get update
RUN apt-get -y install python-pip
RUN pip install -r requirements.txt
EXPOSE 10000/tcp
CMD ["python","sense_exporter.py"]
