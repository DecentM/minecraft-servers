FROM alpine:3.21.3

WORKDIR /root

RUN wget https://github.com/itzg/rcon-cli/releases/download/1.7.0/rcon-cli_1.7.0_linux_amd64.tar.gz && \
    tar -xzf rcon-cli_1.7.0_linux_amd64.tar.gz && \
    rm rcon-cli_1.7.0_linux_amd64.tar.gz

ENV RCON_PATH=/root/rcon-cli

WORKDIR /app

COPY . .
