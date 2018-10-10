FROM ubuntu:zesty

ENV LLVM_VERSION=3.8 \
    CC=clang \
    CXX=clang++ \
    CMAKE_C_COMPILER=clang \
    CMAKE_CXX_COMPILER=clang++

COPY sources.list /etc/apt/sources.list

RUN dpkg --add-architecture i386 \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       sudo=1.8.* \
       git=1:2.* \
       clang-${LLVM_VERSION}=1:3.8.1-* \
       llvm-${LLVM_VERSION}=1:3.8.1-* \
       llvm-${LLVM_VERSION}-dev=1:3.8.1-* \
       llvm-${LLVM_VERSION}-runtime=1:3.8.1-* \
       llvm=1:4.0-* \
       make=4.1-* \
       libc6-dev-i386=2.24-* \
       g++-multilib=4:6.3.* \
       libgmp-dev=2:6.1.* \
       libmpfr-dev=3.1.* \
       libmpc-dev=1.0.* \
       libffi-dev=3.2.* \
       libssl-dev=1.0.* \
       libc++-dev=3.9.* \
       libc++-dev:i386=3.9.* \
       libc++abi-dev=3.9.* \
       libc++abi-dev:i386=3.9.* \
       pkg-config=0.29.1-0ubuntu1 \
       lcov \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${LLVM_VERSION} 100 \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${LLVM_VERSION} 100 \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/clang-${LLVM_VERSION} 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-${LLVM_VERSION} 100 \
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
