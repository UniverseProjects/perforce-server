FROM ubuntu:focal-20210416
RUN mkdir /perforce && useradd -m -d /perforce -U -s /bin/bash perforce
RUN wget -qO - https://package.perforce.com/perforce.pubkey | apt-key add - && echo "deb http://package.perforce.com/apt/ubuntu focal release" > /etc/apt/sources.list.d/perforce.list
RUN apt-get update && apt-get install -y helix-p4d nano && rm -rf /var/lib/apt/lists/*
