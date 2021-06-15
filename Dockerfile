FROM debian:buster-slim

COPY entrypoint.sh /entrypoint.sh

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq \
  && apt-get install -y apt-utils \
  && apt-get upgrade -y \
  && apt-get install -y curl git hub wget \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sfL -o /usr/local/bin/kyml https://github.com/frigus02/kyml/releases/download/v20210610/kyml_20210610_linux_amd64 \
  && chmod +x /usr/local/bin/kyml

ENTRYPOINT ["/entrypoint.sh"]

