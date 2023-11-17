FROM python:3.8-slim

WORKDIR /

RUN apt -y update && \
    apt -y upgrade && \
    apt -y install git && \
    git clone https://github.com/hexway/apple_bleee.git app

WORKDIR /app

RUN apt -y install bluez \
    libpcap-dev \
    libev-dev \
    libnl-3-dev \
    libnl-genl-3-dev \
    libnl-route-3-dev \
    cmake \
    libbluetooth-dev && \
    pip3 install git+https://github.com/pybluez/pybluez.git#egg=pybluez && \
    pip3 install -r requirements.txt