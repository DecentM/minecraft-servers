FROM itzg/minecraft-server:2024.12.1-java21-graalvm

WORKDIR /install

COPY src/ .

# RUN ./install.sh /data/mods

ENV TYPE=FABRIC
ENV VERSION=1.21.1
ENV GUI=false
ENV STOP_DURATION=120
ENV FABRIC_LOADER_VERSION=0.16.10
ENV ENABLE_COMMAND_BLOCK=true

WORKDIR /data

COPY files/ .

VOLUME [ "/data/world" ]
