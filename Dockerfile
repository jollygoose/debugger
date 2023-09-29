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
    zip \
    -yq
RUN apt clean
RUN ansible-pull main.yaml -U https://github.com/jollygoose/playbook-dotfiles
RUN if [[ $(uname -m) == 'aarch64' ]]; then curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"; else curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"; fi
RUN unzip awscliv2.zip
RUN ./aws/install
CMD [ "sleep", "infinity" ]
