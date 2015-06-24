FROM centos:6

MAINTAINER mileswang87
RUN yum -y -q install gcc gcc-java libgcj libgcj-devel gcc-c++ \
    make flex bison gperf ruby openssl-devel freetype-devel \
    fontconfig-devel libicu-devel sqlite-devel libpng-devel libjpeg-devel \
    wget unzip git && yum clean all -y

RUN mkdir /temp && cd /temp \
    && wget https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk-2.02-src.zip && unzip pdftk-2.02-src.zip \
    && cd pdftk-2.02-dist/pdftk \
    && make -f Makefile.Redhat \
    && make -f Makefile.Redhat install \
    && git clone git://github.com/ariya/phantomjs.git phantomjs \
    && cd phantomjs \
    && git checkout 2.0 \
    && ./build.sh --confirm && mv bin/phantomjs /usr/local/bin \
    && cd / && rm -rf /temp