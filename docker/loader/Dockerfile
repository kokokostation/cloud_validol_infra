FROM ubuntu:20.04
SHELL ["/bin/bash", "-c"]

RUN apt update
RUN apt install -y python3-pip libpq-dev cron gettext-base git curl

RUN pip3 install cloud-validol supervisor

COPY crontab /root
RUN crontab /root/crontab

RUN mkdir /var/log/validol

RUN git clone https://github.com/kokokostation/cloud_validol_frontend.git /root/cloud_validol_frontend

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION v16.13.1

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
ENV NODE_PATH $NVM_DIR/$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH

RUN cd /root/cloud_validol_frontend && npm install && npm run build
RUN npm install -g serve

COPY supervisor.conf /root/supervisor.conf
