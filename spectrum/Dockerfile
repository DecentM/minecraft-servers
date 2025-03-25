FROM itzg/minecraft-server:2025.3.0-java23-graalvm

ENV TYPE=FABRIC
ENV VERSION=1.21.1
ENV GUI=false
ENV STOP_DURATION=120
ENV FABRIC_LOADER_VERSION=0.16.10
ENV ENABLE_COMMAND_BLOCK=true
ENV JVM_XX_OPTS="-XX:+UseNUMA -XX:MaxTenuringThreshold=15 -XX:MaxGCPauseMillis=30 -XX:GCPauseIntervalMillis=150 -XX:-UseGCOverheadLimit -XX:SurvivorRatio=8 -XX:TargetSurvivorRatio=90 -Dfml.ignorePatchDiscrepancies=true -Dfml.ignoreInvalidMinecraftCertificates=true -XX:+UseCompressedOops -XX:+OptimizeStringConcat -XX:ReservedCodeCacheSize=2048m -XX:+UseCodeCacheFlushing -XX:SoftRefLRUPolicyMSPerMB=10000 -XX:ParallelGCThreads=10 -XX:ConcGCThreads=5 -Dsun.rmi.dgc.server.gcInterval=3600000 -Dsun.rmi.dgc.client.gcInterval=3600000 -XX:+UnlockExperimentalVMOptions -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:G1HeapRegionSize=32M"

WORKDIR /data

COPY . .

VOLUME [ "/data/world" ]
