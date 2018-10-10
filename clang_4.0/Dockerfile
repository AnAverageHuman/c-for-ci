FROM ubuntu:artful

ENV LLVM_VERSION=4.0 \
    CC=clang \
    CXX=clang++ \
    CMAKE_C_COMPILER=clang \
    CMAKE_CXX_COMPILER=clang++

RUN dpkg --add-architecture i386 \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       sudo=1.8.20p2-1ubuntu1 \
       git=1:2.14.1-1ubuntu4 \
       g++-multilib=4:7.2.0-1ubuntu1 \
       clang-${LLVM_VERSION}=1:4.0.1-6 \
       llvm-${LLVM_VERSION}=1:4.0.1-6 \
       llvm-${LLVM_VERSION}-dev=1:4.0.1-6 \
       llvm-${LLVM_VERSION}-runtime=1:4.0.1-6 \
       llvm=1:4.0-37~exp3ubuntu1 \
       make=4.1-9.1 \
       libc6-dev-i386=2.26-0ubuntu2.1 \
       libgmp-dev=2:6.1.2+dfsg-1 \
       libmpfr-dev=3.1.6-1 \
       libmpc-dev=1.0.3-2 \
       libffi-dev=3.2.1-6 \
       libssl-dev=1.0.2* \
       libc++-dev=3.9.1-3 \
       libc++-dev:i386=3.9.1-3 \
       libc++abi-dev=3.9.1-3 \
       libc++abi-dev:i386=3.9.1-3 \
       pkg-config=0.29.1-0ubuntu2 \
       lcov \
    && update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${LLVM_VERSION} 100 \
    && update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${LLVM_VERSION} 100 \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/clang-${LLVM_VERSION} 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-${LLVM_VERSION} 100 \
    && update-alternatives --install /usr/bin/cpp cpp /usr/bin/clang++-${LLVM_VERSION} 100 \
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
