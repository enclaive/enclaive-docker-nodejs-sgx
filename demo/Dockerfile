FROM ubuntu:jammy

RUN apt-get update \
    && apt-get install -y nodejs curl xxd \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app/

VOLUME /data/

ENTRYPOINT [ "/usr/bin/node" ]
