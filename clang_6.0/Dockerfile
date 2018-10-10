FROM ubuntu:bionic

ENV LLVM_VERSION=6.0 \
    CC=clang \
    CXX=clang++ \
    CMAKE_C_COMPILER=clang \
    CMAKE_CXX_COMPILER=clang++

RUN dpkg --add-architecture i386 \
    && apt-get -qq update \
    && apt-get install -y --no-install-recommends \
       sudo=1.8.21p2-3ubuntu1 \
       curl \
       ca-certificates \
       git \
       g++-multilib=4:7.3.0-3ubuntu2 \
       clang-6.0=1:6.0-1ubuntu2 \
       make=4.1-9.1ubuntu1 \
       libc6-dev-i386=2.27-3ubuntu1 \
       libgmp-dev=2:6.1.2+dfsg-2 \
       libmpfr-dev=4.0.1-1 \
       libmpc-dev=1.1.0-1 \
       libffi-dev=3.2.1-8 \
       libssl-dev=1.1.0* \
       libc++-dev=6.0-2 \
       libc++-dev:i386=6.0-2 \
       libc++abi-dev=6.0-2 \
       libc++abi-dev:i386=6.0-2 \
       pkg-config=0.29.1-0ubuntu2 \
       lcov \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-6.0 100 \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-6.0 100 \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/clang-6.0 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-6.0 100 \
    && update-alternatives --install /usr/bin/cpp cpp /usr/bin/clang++-6.0 100 \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && rm -rf /var/lib/apt/lists/* \
    && groupadd 1001 -g 1001 \
    && groupadd 1000 -g 1000 \
    && groupadd 2000 -g 2000 \
    && groupadd 999 -g 999 \
    && useradd -ms /bin/bash user -g 1001 -G 1000,2000,999 \
    && printf "user:user" | chpasswd \
    && adduser user sudo \
    && printf "user ALL= NOPASSWD: ALL\\n" >> /etc/sudoers

USER user
WORKDIR /home/user
