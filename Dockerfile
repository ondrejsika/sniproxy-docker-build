FROM debian:8

MAINTAINER Ondrej Sika <ondrej@ondrejsika.com>

RUN apt-get update --fix-missing

RUN apt-get install -y autotools-dev cdbs debhelper \
    dh-autoreconf dpkg-dev gettext libev-dev libpcre3-dev libudns-dev \
    pkg-config fakeroot devscripts

RUN apt install -y git

