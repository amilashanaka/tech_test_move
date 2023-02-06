# Build Telescope PHP Debian Base Image
FROM php:7.4-fpm

RUN apt-get update -y \
    && apt-get install -y nginx && apt install -y git && apt install -y unzip && apt install -y zip


RUN curl -sS https://getcomposer.org/installer | php \
  && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

RUN apt-get update && \
    apt-get install -y \
        libzip-dev \
        libpng-dev \
        nodejs \
        npm \
        libgpgme11 \
        libgpgme11-dev \
        cron \
        vim

RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install sockets

RUN mkdir /var/www/app
WORKDIR /var/www/app

COPY ./etc/nginx.conf /etc/nginx/sites-enabled/default
COPY ./etc/nginx_custom_settings.conf /etc/nginx/conf.d/
# COPY ./etc/entrypoint.sh /etc/entrypoint.sh
COPY ./etc/php.ini /usr/local/etc/php/conf.d/
#COPY ./etc/entrypoint.sh /etc/

RUN service nginx start
#RUN php-fpm
#ENTRYPOINT ["/etc/entrypoint.sh"]
# CMD chmod -R 777 /etc/entrypoint.sh
# CMD ["./entrypoint.sh"]

