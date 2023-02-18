FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC 
WORKDIR /root
RUN apt update && apt install \
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
    -yq \
    netcat
RUN apt clean
RUN python3 -m pip install ansible
RUN ansible-pull main.yaml -U https://github.com/jollygoose/playbook-dotfiles
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
CMD [ "sleep", "infinity" ]
