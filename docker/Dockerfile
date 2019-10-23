FROM php:7.2-fpm

ENV TERM=xterm-256color

# install the PHP extensions we need (https://make.wordpress.org/hosting/handbook/handbook/server-environment/#php-extensions)
RUN set -ex; \
    \
    savedAptMark="$(apt-mark showmanual)"; \
    \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    libjpeg-dev \
    libmagickwand-dev \
    libpng-dev \
    ; \
    \
    docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
    docker-php-ext-install \
    bcmath \
    exif \
    gd \
    mysqli \
    opcache \
    zip \
    ; \
    pecl install imagick-3.4.4; \
    docker-php-ext-enable imagick; \
    \
    # reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
    apt-mark auto '.*' > /dev/null; \
    apt-mark manual $savedAptMark; \
    ldd "$(php -r 'echo ini_get("extension_dir");')"/*.so \
    | awk '/=>/ { print $3 }' \
    | sort -u \
    | xargs -r dpkg-query -S \
    | cut -d: -f1 \
    | sort -u \
    | xargs -rt apt-mark manual; \
    \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
    rm -rf /var/lib/apt/lists/*

# RUN apt-get update && apt-get install -y \
#     git \
#     subversion \
#     wget \
#     libxml2-dev \
#     ssmtp \
#     imagemagick \
#     libmagickwand-dev \
#     unzip \
#     iproute2 \
#     libicu-dev \
#     && pecl install imagick \
#     && docker-php-ext-enable imagick \
#     && docker-php-ext-install soap intl \
#     && echo "mailhub=mailcatcher:1025\nUseTLS=NO\nFromLineOverride=YES" > /etc/ssmtp/ssmtp.conf \
#     && apt-get remove -y libmagickwand-dev libxml2-dev libicu-dev \
#     && apt-get autoremove -y \
#     && apt-get clean \
#     && mkdir /var/www/.wp-cli \
#     && chown www-data:www-data /var/www/.wp-cli

VOLUME /var/www/html
