FROM python:3-buster
LABEL maintainer="dev@exploit.design"

ARG VER

RUN \
 apt update && \
 apt install -y \
   ca-certificates \
   libsecp256k1-0 \
   libgl-dev \
   gnupg \
   qt5dxcb-plugin \
   xcb-proto \
   wget && \
 useradd -m -s /bin/bash user


RUN \
 wget "https://download.electrum.org/${VER}/Electrum-${VER}.tar.gz" && \
 wget "https://download.electrum.org/${VER}/Electrum-${VER}.tar.gz.asc" && \
 gpg --recv-key --keyserver keyserver.ubuntu.com 6694D8DE7BE8EE5631BED9502BD5824B7F9470E6 && \
 gpg --verify "Electrum-${VER}.tar.gz.asc" && \
 python3 -m pip install -U pyqt5 cryptography pycryptodomex && \
 python3 -m pip install "Electrum-${VER}.tar.gz" && \
 rm "Electrum-${VER}.tar.gz.asc" && \
 rm "Electrum-${VER}.tar.gz"

USER user

ENTRYPOINT ["electrum"]
