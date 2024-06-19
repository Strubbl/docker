FROM debian:stable-slim as osmium_builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        cmake \
        g++ \
        git \
        make \
        libboost-program-options-dev \
        libbz2-dev \
        libexpat1-dev \
        libgdal-dev \
        libgeos++-dev \
        liblz4-dev \
        libproj-dev \
        libprotozero-dev \
        zlib1g-dev && \
        git clone --branch v2.20.0 https://github.com/osmcode/libosmium.git /libosmium && \
        cd /libosmium/build && \
        cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .. && \
        make && \
        make install && \
        git clone --branch v1.16.0 https://github.com/osmcode/osmium-tool.git /osmium-tool && \
        cd /osmium-tool/build && \
        cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .. && \
        make && \
        make install

CMD ["/usr/local/bin/osmium"]
