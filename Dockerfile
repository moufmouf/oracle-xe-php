FROM wnameless/oracle-xe-11g-r2

RUN apt-get update && apt-get install -y software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
RUN apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends php7.4 php7.4-dev build-essential php-pear php7.4-mysql php7.4-curl php7.4-json php7.4-gd php7.4-msgpack php7.4-memcached php7.4-intl php7.4-sqlite3 php7.4-gmp php7.4-geoip php7.4-mbstring php7.4-redis php7.4-xml php7.4-zip

# Now, let's install the PHP driver
RUN pear download pecl/oci8-2.2.0
RUN tar xvzf oci8-2.2.0.tgz
## RUN export PHP_DTRACE=yes
RUN cd oci8-2.2.0/ && phpize && ./configure --with-oci8=shared,/u01/app/oracle/product/11.2.0/xe && make && make install


ADD oci8.ini /etc/php/7.4/cli/conf.d/oci8.ini

RUN mkdir /app

ADD entrypoint_overloaded.sh /entrypoint_overloaded.sh

ENTRYPOINT ["/bin/bash", "-c", "/entrypoint_overloaded.sh ${*}", "--"]
