# Centos image with php-fpm

### Installed packages (based on ius repository):
 - php-cli
 - php-fpm
 - php-bcmath
 - php-gd
 - php-intl
 - php-json
 - php-ldap
 - php-mbstring
 - php-mcrypt
 - php-opcache
 - php-pdo
 - php-pear
 - php-pecl-apcu
 - php-pecl-imagick
 - php-pecl-redis
 - php-pecl-xdebug
 - php-pgsql
 - php-mysqlnd
 - php-soap
 - php-tidy
 - php-xml
 - php-xmlrpc
 - and **composer** 
 
### docker-compose : 
     
    version: "2.1"

    services:

        # add an apache or nginx service

        php:
            image: miveo/centos-php-fpm
            tty: true
            volumes:
                # mount your source 
                - ../:/var/www
                # add a shared ini configuration file specific to your project
                - ./php/99-test-project.ini:/etc/php.d/99-test-project.ini
