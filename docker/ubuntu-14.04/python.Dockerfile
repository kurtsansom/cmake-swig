FROM ubuntu:14.04
LABEL maintainer="mizux.dev@gmail.com"

# Base install
RUN apt-get update -qq \
&& apt-get install -yq git cmake3 build-essential \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Swig
RUN apt-get update -qq \
&& apt-get install -yq wget \
&& wget "https://downloads.sourceforge.net/project/swig/swig/swig-3.0.12/swig-3.0.12.tar.gz" \
&& tar xvf swig-3.0.12.tar.gz && rm swig-3.0.12.tar.gz \
&& cd swig-3.0.12 && ./configure --prefix=/usr && make -j 4 && make install \
&& cd .. && rm -rf swig-3.0.12

# Python install
RUN apt-get update -qq \
&& apt-get install -yq python3-dev python3-pip python3-wheel \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
