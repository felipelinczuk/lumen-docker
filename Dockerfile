FROM php:8.3-rc-fpm-alpine3.18

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php8.3-mysql \
    php8.3-bcmath \
    php8.3-gd \
    php8.3-imap \
    php-yaml \
    vim \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

WORKDIR /var/www/html/

COPY . ./api/

WORKDIR /var/www/html/api/

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

RUN composer update

RUN docker-php-ext-install mysqli pdo pdo_mysql

WORKDIR /var/www/html/api/

RUN composer install

#CMD [""]

#ENTRYPOINT ["ls"]

#EXPOSE 8081 