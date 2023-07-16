FROM ghcr.io/ofload-2-0/ofload-php-image/ofload-php:latest as php

COPY ./deployment/docker/fpm/php.ini /usr/local/etc/php/conf.d/docker-php-config.ini

COPY . .

# By default, use file caching during build as redis will not be available yet
ARG CACHE_DRIVER=file

# RUN chown -R www-data:www-data /var/www
RUN chown -R www-data:www-data \
 /var/www/storage \
 /var/www/bootstrap/cache

# dev target
FROM php as php-dev

RUN install-php-extensions xdebug
