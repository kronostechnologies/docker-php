FROM cimg/php:7.4-node
MAINTAINER sysadmin@kronostechnologies.com


RUN sudo apt-get update && sudo apt-get install -y \
    php$PHP_MINOR-apcu \
    php$PHP_MINOR-apcu-bc \
    php$PHP_MINOR-bcmath \
    php$PHP_MINOR-curl \
    php$PHP_MINOR-fpm \
    php$PHP_MINOR-cgi \
    php$PHP_MINOR-gd \
    php$PHP_MINOR-gearman \
    php$PHP_MINOR-imap \
    php$PHP_MINOR-intl \
    php$PHP_MINOR-mbstring \
    php$PHP_MINOR-memcached \
    php$PHP_MINOR-mysqlnd \
    php$PHP_MINOR-soap \
    php$PHP_MINOR-redis \
    php$PHP_MINOR-tidy \
    php$PHP_MINOR-xsl \
    php$PHP_MINOR-zip && \
    sudo rm -rf /var/lib/apt/lists/*

RUN sudo pecl install pcov && \
    sudo sh -c 'echo "extension=pcov.so" > /etc/php/7.4/mods-available/pcov.ini' && \
    sudo phpenmod pcov && \
    sudo composer self-update --2
