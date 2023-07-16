FROM ghcr.io/ofload-2-0/ofload-php-image/ofload-php:latest as php

COPY ./deployment/docker/fpm/php.ini /usr/local/etc/php/conf.d/docker-php-config.ini

COPY . .

RUN mkdir -p /var/www/storage && chown -R www-data:www-data /var/www/storage

# dev target
FROM php as php-dev

RUN install-php-extensions xdebug