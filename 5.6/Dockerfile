FROM centos:7
MAINTAINER Julien Guyon <j.guyon@miveo.fr>

RUN yum -y --setopt=tsflags=nodocs update && \
    yum -y --setopt=tsflags=nodocs --nogpgcheck install epel-release && \
    yum -y --setopt=tsflags=nodocs --nogpgcheck install https://centos7.iuscommunity.org/ius-release.rpm && \
    yum -y --setopt=tsflags=nodocs --nogpgcheck install php56u-cli \
        php56u-fpm \
        php56u-bcmath \
        php56u-gd \
        php56u-intl \
        php56u-json \
        php56u-ldap  \
        php56u-mbstring \
        php56u-mcrypt \
        php56u-opcache \
        php56u-pdo \
        php56u-pear  \
        php56u-pecl-apcu \
        php56u-pecl-imagick \
        php56u-pecl-redis \
        php56u-pecl-xdebug  \
        php56u-pgsql \
        php56u-mysqlnd \
        php56u-soap \
        php56u-tidy \
        php56u-xml \
        php56u-xmlrpc && \
        yum clean all

RUN rm /etc/php-fpm.d/www.conf
ADD pool.conf /etc/php-fpm.d/
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

CMD ["php-fpm", "-F"]

EXPOSE 9000