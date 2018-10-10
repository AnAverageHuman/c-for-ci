FROM ubuntu:bionic

RUN dpkg --add-architecture i386 \
    && apt-get -qq update \
    && apt-get install -y --no-install-recommends \
       sudo=1.8.21p2-3ubuntu1 \
       curl \
       ca-certificates \
       binutils=2.* \
       git \
       libc6-dev-i386=2.27-3ubuntu1 \
       linux-libc-dev:i386=4.* \
       g++-8-multilib=8.2.* \
       libgmp-dev=2:6.1.2+dfsg-2 \
       libmpfr-dev=4.0.1-1 \
       libmpc-dev=1.1.0-1 \
       libc6-dev=2.27-3ubuntu1 \
       libffi-dev=3.2.1-8 \
       libssl-dev=1.* \
       pkg-config=0.29.1-0ubuntu2 \
       lcov \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-8 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-8 100 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 100 \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-8 100 \
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
