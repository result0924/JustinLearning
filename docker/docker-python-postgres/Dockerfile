FROM python:3.6

RUN apt-get update

RUN apt-get install -y postgresql-client

WORKDIR /app

ADD . /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80