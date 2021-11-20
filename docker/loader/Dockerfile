FROM ubuntu:20.04

RUN apt update
RUN apt install -y python3-pip libpq-dev cron gettext-base

RUN pip3 install cloud-validol

COPY crontab .
RUN crontab ./crontab
