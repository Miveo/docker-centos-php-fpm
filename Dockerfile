FROM centos:7
MAINTAINER Julien Guyon <j.guyon@miveo.fr>

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs --nogpgcheck install epel-release && \
    yum -y --setopt=tsflags=nodocs --nogpgcheck install https://centos7.iuscommunity.org/ius-release.rpm && \
    yum -y --setopt=tsflags=nodocs --nogpgcheck install php70u-cli \
        php70u-fpm \
        php70u-bcmath \
        php70u-gd \
        php70u-intl \
        php70u-json \
        php70u-ldap  \
        php70u-mbstring \
        php70u-mcrypt \
        php70u-opcache \
        php70u-pdo \
        php70u-pear  \
        php70u-pecl-apcu \
        php70u-pecl-imagick \
        php70u-pecl-redis \
        php70u-pecl-xdebug  \
        php70u-pgsql \
        php70u-mysqlnd \
        php70u-soap \
        php70u-tidy \
        php70u-xml \
        php70u-xmlrpc && \
        yum clean all

RUN rm /etc/php-fpm.d/www.conf
ADD pool.conf /etc/php-fpm.d/
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

CMD ["php-fpm", "-F"]

EXPOSE 9000