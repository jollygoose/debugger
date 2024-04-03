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
    apt clean &&\
    if [[ $(uname -m) == 'aarch64' ]]; then curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ~./aws/install; else curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ~./aws/install; fi
CMD [ "sleep", "10000" ]
