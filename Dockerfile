
FROM ubuntu:18.04

# Adapted from https://github.com/msmitherdc/mapserver-docker/blob/master/Dockerfile
# on 1/4/2020
MAINTAINER James Gardner <jsg@internode.on.net>

USER root

# Set the locale
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update&& apt-get -y install locales tzdata software-properties-common && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen&&\
    ln -fs /usr/share/zoneinfo/Australia/Perth /etc/localtime \
    &&dpkg-reconfigure --frontend noninteractive tzdata
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8  

RUN add-apt-repository ppa:ubuntugis/ppa


RUN apt-get update && apt-get install -y --fix-missing --no-install-recommends build-essential ca-certificates curl wget \
    git libaio1 make cmake software-properties-common  libc6-dev libfreetype6-dev \
    libcairo2-dev flex bison libfcgi-dev libxml2 libxml2-dev bzip2 \
    bison flex python-lxml libfribidi-dev swig \
    cmake librsvg2-dev colordiff libpq-dev libpng-dev libjpeg-dev libgif-dev libgeos-dev libgd-dev \
    libfreetype6-dev libfcgi-dev libcurl4-gnutls-dev libcairo2-dev libgdal-dev libproj-dev libxml2-dev \
    libxslt1-dev python-dev php-dev libexempi-dev lcov lftp libgdal-dev ninja-build git curl \
    clang libprotobuf-c-dev protobuf-c-compiler libharfbuzz-dev libcairo2-dev librsvg2-dev dialog php7.2 \
   && apt-get remove --purge -y $BUILD_PACKAGES  && rm -rf /var/lib/apt/lists/*




ARG MAPSERVER_VERSION
RUN mkdir /build && cd /build && \
    git clone https://github.com/mapserver/mapserver.git mapserver && \
    cd /build/mapserver && \
    git checkout branch-7-4 \
    && mkdir /build/mapserver/build \
    && cd /build/mapserver/build \
    && cmake \
      -DCMAKE_BUILD_TYPE=Release \
      -DWITH_CLIENT_WFS=ON \
      -DWITH_CLIENT_WMS=ON \
      -DWITH_CURL=ON \
      -DWITH_GDAL=ON \
      -DWITH_GIF=ON \
      -DWITH_ICONV=ON \
      -DWITH_KML=ON \
      -DWITH_LIBXML2=ON \
      -DWITH_OGR=ON \
      -DWITH_ORACLESPATIAL=OFF \
      -DWITH_POINT_Z_M=ON \
      -DWITH_PROJ=ON \
      -DWITH_SOS=ON  \
      -DWITH_THREAD_SAFETY=ON \
      -DWITH_WCS=ON \
      -DWITH_WFS=ON \
      -DWITH_WMS=ON \
      -DWITH_FCGI=ON \
      -DWITH_FRIBIDI=OFF \
      -DWITH_CAIRO=OFF \
      -DWITH_POSTGRES=OFF \
      -DWITH_HARFBUZZ=OFF \
      -DWITH_POSTGIS=OFF \
      -DWITH_PROTOBUFC=0 \
      -DWITH_PHPNG=1 \
      -DWITH_PHP=1 \
      ..  \
    && make  \
    && make install \
    && ldconfig
#    && rm -Rf /build/mapserver

# Clean up
#RUN  apt-get purge -y software-properties-common build-essential cmake ;\
# apt-get autoremove -y ; \
# apt-get clean ; \
# rm -rf /var/lib/apt/lists/partial/* /tmp/* /var/tmp/*
RUN mkdir /data
WORKDIR /data
RUN wget "https://raw.githubusercontent.com/nvkelso/natural-earth-raster/master/10m_rasters/NE1_HR_LC_SR_W_DR/NE1_HR_LC_SR_W_DR.tif" \
      --output-document="raster.tif"
# points.shp and mapfile
COPY ./data /data/
RUN chown www-data:www-data /data -R
RUN chmod 777 /data -R

