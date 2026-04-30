FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC 

WORKDIR /root

RUN apt update && apt install -y \
    ansible \
    curl \
    dnsutils \
    fish \
    git \
    htop \
    jdupes \
    iproute2 \
    jdupes \
    jq \
    ncdu \
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
    -yq && apt clean

RUN git clone https://github.com/jollygoose/playbook-dotfiles
WORKDIR /root/playbook-dotfiles
RUN mv example_inventory.ini inventory.ini
RUN ansible-playbook main.yaml --connection=local  

CMD [ "sleep", "infinity" ]