FROM codercom/enterprise-base:ubuntu
USER root

# Copy configuration files to appropriate locations
COPY files /
ARG DEBIAN_FRONTEND="noninteractive"

RUN apt-get update && \
    apt-get install --no-install-recommends --yes --quiet \
      netcat-openbsd \
      proxychains4 \
      python3 && \
    apt-get install --no-install-recommends --yes --quiet \
      tailscale && \
    # Delete package cache to avoid consuming space in layer
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER coder

ENV ALL_PROXY=socks5://localhost:1080
ENV http_proxy=http://localhost:3128
