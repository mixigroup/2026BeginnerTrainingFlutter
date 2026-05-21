# ------------------------------------------------------------
# ビルドステージ
# ------------------------------------------------------------
FROM ubuntu:26.04@sha256:f3d28607ddd78734bb7f71f117f3c6706c666b8b76cbff7c9ff6e5718d46ff64 AS build

ARG STRFRY_VERSION=1.1.0

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates=20260223 \
  g++=4:15.2.0-5ubuntu1 \
  git=1:2.53.0-1ubuntu1 \
  libflatbuffers-dev=23.5.26+dfsg-4build1 \
  liblmdb-dev=0.9.31-1build2 \
  libsecp256k1-dev=0.7.0-2 \
  libssl-dev=3.5.5-1ubuntu3 \
  libtool=2.5.4-9 \
  libzstd-dev=1.5.7+dfsg-3 \
  make=4.4.1-3 \
  pkg-config=2.5.1-4 \
  zlib1g-dev=1:1.3.dfsg+really1.3.1-1ubuntu3 \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/strfry
RUN git clone --branch "${STRFRY_VERSION}" --depth 1 --recurse-submodules --shallow-submodules https://github.com/hoytech/strfry . && \
  make setup-golpe && \
  make NPROC=1 OPT='-O1 -g0' -j1

# ------------------------------------------------------------
# 実行ステージ
# ------------------------------------------------------------
FROM ubuntu:26.04@sha256:f3d28607ddd78734bb7f71f117f3c6706c666b8b76cbff7c9ff6e5718d46ff64

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
  libb2-1=0.98.1-1.1build2 \
  libflatbuffers23.5.26=23.5.26+dfsg-4build1 \
  liblmdb0=0.9.31-1build2 \
  libsecp256k1-6=0.7.0-2 \
  libzstd1=1.5.7+dfsg-3 \
  && rm -rf /var/lib/apt/lists/*

COPY --from=build /tmp/strfry/strfry /usr/local/bin/strfry
COPY strfry.conf /etc/strfry.conf

EXPOSE 8080

RUN mkdir -p /tmp/db

CMD ["strfry", "relay"]
