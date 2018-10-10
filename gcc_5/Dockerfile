FROM ubuntu:xenial

RUN dpkg --add-architecture i386 \
    && apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends \
       sudo=1.8.* \
       build-essential=12.* \
       git=1:2.7.* \
       libc6-dev-i386=2.23-* \
       g++-multilib=4:5.3.* \
       libgmp-dev=2:6.1.* \
       libmpfr-dev=3.1.* \
       libmpc-dev=1.0.* \
       libc6-dev=2.23-* \
       libffi-dev=3.2.* \
       libssl-dev=1.0.2* \
       pkg-config=0.29.1-0ubuntu1 \
       lcov \
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
