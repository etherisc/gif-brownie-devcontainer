FROM python:3.9-bullseye

ENV NODE_VERISON 16
ENV NVM_DIR /usr/local/nvm
SHELL ["/bin/bash", "-c"]

# install node 16 via nvm
RUN mkdir -p ${NVM_DIR} \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERISON \
    && nvm alias default $NODE_VERSION \
    && nvm use default 


WORKDIR /setup

COPY prepare_environment.sh .
RUN ./prepare_environment.sh

WORKDIR /workspace
