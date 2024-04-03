FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC 
WORKDIR /root
RUN apt update && apt install \
    ansible \
    curl \
    dnsutils \
    fish \
    git \
    htop \
    iproute2 \
    jq \
    netcat \
    python3-pip \
    ranger \
    rsync \
    tcpdump \
    telnet \
    traceroute \
    unzip \
    vim \
    zip \
    zsh \
    -yq &&\
    apt clean
CMD [ "sleep", "10000" ]
