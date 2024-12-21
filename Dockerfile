FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libpq-dev \
    && docker-php-ext-install pdo pdo_pgsql

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


WORKDIR /var/www/html

COPY . .

RUN chown -R www-data:www-data /var/www/html/storage

CMD php artisan serve --host=0.0.0.0 --port=8000
