FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    zip unzip curl libpng-dev libonig-dev libxml2-dev libzip-dev git \
    && docker-php-ext-install pdo pdo_mysql mbstring zip

WORKDIR /var/www

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
