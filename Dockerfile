FROM ubuntu:focal-20210416
RUN mkdir /perforce
EXPOSE 1666
RUN useradd -m -d /perforce -U -s /bin/bash perforce && mkdir /perforce/root && chown -R perforce:perforce /perforce
ENV P4USER=perforce P4PORT=ssl:0.0.0.0:1666 P4ROOT=/perforce/root
WORKDIR /perforce/root
VOLUME /perforce
RUN apt-get update && apt-get install -y wget gnupg && wget -qO - https://package.perforce.com/perforce.pubkey | apt-key add - && echo "deb http://package.perforce.com/apt/ubuntu focal release" > /etc/apt/sources.list.d/perforce.list &&  apt-get update && apt-get install -y helix-p4d nano && rm -rf /var/lib/apt/lists/*
USER perforce
CMD p4d