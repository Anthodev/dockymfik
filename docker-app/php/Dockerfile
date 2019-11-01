# FROM alpine:3.8
FROM php:7.3.10-apache

LABEL maintainer="Cedric Anthony <cedric@antho.dev>"

RUN buildDeps=" \
    default-libmysqlclient-dev \
    libbz2-dev \
    libmemcached-dev \
    libsasl2-dev \
    " \
    runtimeDeps=" \
    curl \
    git \
    unzip \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libldap2-dev \
    libmemcachedutil2 \
    libpng-dev \
    libpq-dev \
    libxml2-dev \
    libzip-dev \
    " \
    && apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y $buildDeps $runtimeDeps \
    && docker-php-ext-install bcmath bz2 calendar iconv intl mbstring mysqli opcache pdo_mysql pdo_pgsql pgsql soap zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
    && docker-php-ext-install ldap \
    && docker-php-ext-install exif \
    && pecl install memcached redis \
    && docker-php-ext-enable memcached.so redis.so \
    && apt-get purge -y --auto-remove $buildDeps \
    && rm -r /var/lib/apt/lists/* \
    && a2enmod rewrite

RUN echo "$(curl -sS https://composer.github.io/installer.sig) -" > composer-setup.php.sig \
    && curl -sS https://getcomposer.org/installer | tee composer-setup.php | sha384sum -c composer-setup.php.sig \
    && php composer-setup.php && rm composer-setup.php* \
    && chmod +x composer.phar && mv composer.phar /usr/bin/composer

RUN usermod -u 1000 www-data

# COPY symfony.ini /etc/php7.3/conf.d/
# COPY symfony.ini /etc/php7.3/cli/conf.d/
COPY xdebug.ini  /etc/php7.3/conf.d/

# COPY symfony.pool.conf /etc/php7/php-fpm.d/
COPY vhost.conf /etc/apache2/sites-enabled/

RUN echo 'alias sf="php bin/console"' >> ~/.bashrc

# CMD ["php-fpm7", "-F"]

WORKDIR /var/www/app/

RUN chown -R www-data:www-data /var/www/app/

EXPOSE 9000
