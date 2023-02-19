FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC 
WORKDIR /root
RUN apt update && apt install \
    ansible \
    iproute2 \
    tcpdump \
    curl \
    git \
    telnet \
    dnsutils \
    zip \
    unzip \
    traceroute \
    fish \
    python3-pip \
    rsync \
    jq \
    ranger \
    netcat
RUN apt clean
RUN if [[ $(uname -m) == 'aarch64' ]]; then curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; else curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; fi
RUN unzip awscliv2.zip
RUN ./aws/install
CMD [ "sleep", "infinity" ]
