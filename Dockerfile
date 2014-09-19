FROM ubuntu:14.04
MAINTAINER Kieran Johnson <kieran@invisiblelines.com>

ENV RUBY_VERSION 2.1.2
ENV DEBIAN_FRONTEND noninteractive
RUN locale-gen en_GB.UTF-8
ENV LANG en_GB.UTF-8
ENV LC_ALL en_GB.UTF-8
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# System upgrade
RUN apt-get -qq update && \
    apt-get -qqy upgrade; \
    apt-get -qqy install \
      build-essential \
      software-properties-common \
      python-software-properties \
      openssl \
      ca-certificates \
      git-core \
      unzip \
      imagemagick \
      curl \
      bison \
      zlib1g-dev \
      libgdbm-dev \
      libreadline6-dev \
      libncurses5-dev \
      libyaml-dev \
      libssl-dev \
      libxslt-dev \
      libxml2-dev; \
    apt-get clean -y; \
    apt-get autoremove -y

RUN locale-gen en_GB.UTF-8 && dpkg-reconfigure locales

RUN echo "Europe/London" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

RUN git clone https://github.com/sstephenson/ruby-build.git
RUN cd ruby-build && ./install.sh
RUN ruby-build $RUBY_VERSION /usr/local

RUN echo "gem: --no-document" > ~/.gemrc

RUN gem install bundler

CMD /bin/bash