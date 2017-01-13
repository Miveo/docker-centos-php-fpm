FROM centos:7
MAINTAINER Julien Guyon <j.guyon@miveo.fr>

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs --nogpgcheck install epel-release && \
    yum -y --setopt=tsflags=nodocs --nogpgcheck install https://centos7.iuscommunity.org/ius-release.rpm && \
    yum -y --setopt=tsflags=nodocs --nogpgcheck install php71u-cli \
        php71u-fpm \
        php71u-bcmath \
        php71u-gd \
        php71u-intl \
        php71u-json \
        php71u-ldap  \
        php71u-mbstring \
        php71u-mcrypt \
        php71u-opcache \
        php71u-pdo \
        php71u-pear  \
        php71u-pecl-apcu \
        php71u-pecl-imagick \
        php71u-pecl-redis \
        php71u-pecl-xdebug  \
        php71u-pgsql \
        php71u-mysqlnd \
        php71u-soap \
        php71u-tidy \
        php71u-xml \
        php71u-xmlrpc && \
        yum clean all

RUN rm /etc/php-fpm.d/www.conf
ADD pool.conf /etc/php-fpm.d/
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

CMD ["php-fpm", "-F"]

EXPOSE 9000