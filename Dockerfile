FROM alpine:3.4

ENV COMPOSE_VERSION 0.9.2
ENV COMPOSE_SHA256 d2329148700cd82e6fdd4fd6bf85a4dff571b1539b47b20ddd3099f8baca06d3

RUN apk add --no-cache \
		ca-certificates \
		curl \
		openssl

RUN set -x && \
  curl -fSL -o compose.tgz "https://github.com/rancher/rancher-compose/releases/download/v${COMPOSE_VERSION}/rancher-compose-linux-amd64-v${COMPOSE_VERSION}.tar.gz" && \
	echo "$COMPOSE_SHA256 *compose.tgz" | sha256sum -c - && \
	tar -xzvf compose.tgz && \
  mv rancher-compose-v${COMPOSE_VERSION}/rancher-compose /usr/local/bin/ && \
  rmdir rancher-compose-v${COMPOSE_VERSION} && \
  rm compose.tgz && \
  rancher-compose --version

WORKDIR /compose

ENTRYPOINT ["/usr/local/bin/rancher-compose"]
