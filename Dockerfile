FROM debian:12

LABEL maintainer="yourname <you@example.com>"
LABEL description="XrayR + WireGuard container (WireGuard only active inside container)"

RUN apt-get update &&     apt-get install -y curl wget unzip iproute2 wireguard-tools iptables openresolv &&     apt-get clean

WORKDIR /opt

RUN wget -O XrayR.zip https://github.com/XrayR-project/XrayR/releases/latest/download/XrayR-linux-64.zip &&     unzip XrayR.zip && rm XrayR.zip && chmod +x XrayR

COPY entrypoint.sh /entrypoint.sh
COPY config.yml /opt/config.yml
COPY wg.conf /etc/wireguard/wg.conf

RUN chmod +x /entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
