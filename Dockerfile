FROM dunglas/frankenphp:latest-php8.3

RUN install-php-extensions pdo_mysql pcntl bcmath ctype fileinfo mbstring openssl tokenizer xml zip

WORKDIR /app

COPY composer.json composer.lock ./
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --no-dev --no-scripts --no-autoloader --prefer-dist

COPY . .
RUN composer dump-autoload --optimize --no-dev

RUN chown -R www-data:www-data /app/storage /app/bootstrap/cache

# FrankenPHP akan otomatis mendeteksi public/index.php
