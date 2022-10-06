FROM python:3.9-bullseye

# install node 16 via nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash \
    && . /root/.nvm/nvm.sh \
    && nvm install 16 \
    && nvm use 16 \
    && nvm alias default 16

WORKDIR /setup

COPY prepare_environment.sh .
RUN ./prepare_environment.sh

WORKDIR /workspace
