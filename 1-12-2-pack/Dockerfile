FROM itzg/minecraft-server:2024.12.1-java8-graalvm-ce

RUN curl -L https://solder.endermedia.com/repository/downloads/the-1122-pack/the-1122-pack_1.6.4.zip -o /tmp/the-1122-pack.zip && unzip /tmp/the-1122-pack.zip -d /data && rm /tmp/the-1122-pack.zip

WORKDIR /install

COPY src/ .

RUN ./install.sh /data/mods

ENV TYPE=FORGE
ENV VERSION=1.12.2
ENV GUI=false
ENV STOP_DURATION=120
ENV ALLOW_FLIGHT=true
ENV FORGE_VERSION=14.23.5.2860

WORKDIR /data

COPY files/ .

VOLUME [ "/data/world" ]
