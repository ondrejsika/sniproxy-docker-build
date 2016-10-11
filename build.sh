#!/bin/bash
set -e

IMAGETAG=sniproxy-build
FIRMWARETAG=${1:-master}

docker build -t $IMAGETAG .
docker run -t -v $(pwd)/output:/output $IMAGETAG /bin/sh -c "\
    git clone https://github.com/dlundquist/sniproxy.git && \
    cd sniproxy/ && \
    git checkout $FIRMWARETAG && \
    ./autogen.sh && \
    dpkg-buildpackage && \
    cp ../sniproxy_*_*.deb /output
"

