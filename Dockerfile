FROM debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install
ADD gpg/* /etc/apt/trusted.gpg.d/
RUN sed -i 's/main$/main contrib non-free/g' /etc/apt/sources.list && \
apt-get update && apt-get install -y apt-transport-https lsb-release ca-certificates && \
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
mkdir -p /usr/share/man/man1/ && apt-get update && apt-get install -y --no-install-recommends \
bzip2 \
ca-certificates \
php8.1-apcu \
php8.1-bcmath \
php8.1-curl \
php8.1-fpm \
php8.1-cgi \
php8.1-gd \
php8.1-gearman \
php8.1-imap \
php8.1-intl \
php8.1-mbstring \
php8.1-memcached \
php8.1-mysqlnd \
php8.1-pcov \
php8.1-soap \
php8.1-redis \
php8.1-tidy \
php8.1-xsl \
php8.1-zip \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*


# Install the PHP package manager Composer
ENV COMPOSER_VERSION 2.1.12
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php composer-setup.php --version=$COMPOSER_VERSION --install-dir=/usr/local/bin --filename=composer && \
	php -r "unlink('composer-setup.php');" && \
	composer --version
