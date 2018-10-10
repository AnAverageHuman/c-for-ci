FROM ubuntu:artful

RUN dpkg --add-architecture i386 \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       sudo=1.8.* \
       binutils=2.29.* \
       git=1:2.14.* \
       libc6-dev-i386=2.26-* \
       linux-libc-dev:i386=4.13.* \
       g++-6-multilib=6.4.* \
       libgmp-dev=2:6.1.* \
       libmpfr-dev=3.1.* \
       libmpc-dev=1.0.* \
       libc6-dev=2.26* \
       libffi-dev=3.2.* \
       libssl-dev=1.0.2* \
       pkg-config=0.29.1-0ubuntu2 \
       lcov \
    && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 100 \
    && update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++-6 100 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 100 \
    && update-alternatives --install /usr/bin/cc cc /usr/bin/gcc-6 100 \
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
