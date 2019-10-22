FROM ubuntu:16.04

ENV TERM=xterm-256color

RUN apt-get update && apt-get install -y \
    git \
    subversion \
    wget \
    libxml2-dev \
    ssmtp \
    imagemagick \
    libmagickwand-dev \
    unzip \
    iproute2 \
    libicu-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install soap intl \
    && echo "mailhub=mailcatcher:1025\nUseTLS=NO\nFromLineOverride=YES" > /etc/ssmtp/ssmtp.conf \
    && apt-get remove -y libmagickwand-dev libxml2-dev libicu-dev \
    && apt-get autoremove -y \
    && apt-get clean \
    && mkdir /var/www/.wp-cli \
    && chown www-data:www-data /var/www/.wp-cli

WORKDIR /app

EXPOSE 8080

ADD entry.sh /opt/
RUN chmod 755 /opt/entry.sh
