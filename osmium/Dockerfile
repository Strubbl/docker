FROM debian:stable-slim as osmium_builder

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        cmake \
        g++ \
        git \
        make \
        libboost-program-options-dev \
        libboost-dev \
        libbz2-dev \
        libexpat1-dev \
        libgdal-dev \
        libgeos++-dev \
        liblz4-dev \
        libosmpbf-dev \
        libproj-dev \
        libprotobuf-dev \
        libprotozero-dev \
        protobuf-compiler \
        zlib1g-dev && \
        \
        git clone --branch v2.20.0 https://github.com/osmcode/libosmium.git /libosmium && \
        mkdir /libosmium/build && \
        cd /libosmium/build && \
        cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .. && \
        make && \
        make install && \
        git clone --branch v1.16.0 https://github.com/osmcode/osmium-tool.git /osmium-tool && \
        mkdir /osmium-tool/build && \
        cd /osmium-tool/build && \
        cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo .. && \
        make && \
        make install

CMD ["/usr/local/bin/osmium"]
