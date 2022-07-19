FROM php:8.0-fpm
ADD ./www.conf /usr/local/etc/php-fpm.d/www.conf
RUN apt-get update
RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-configure zip\
  && docker-php-ext-install zip
RUN docker-php-ext-install mysqli pdo pdo_mysql
ARG USER_ID
ARG GROUP_ID
RUN addgroup --gid $GROUP_ID php_docker
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID php_docker


RUN mkdir -p /var/www/html	
RUN chown php_docker:php_docker /var/www/html
WORKDIR /var/www/html	
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions && sync 
RUN install-php-extensions gd
USER php_docker



# FROM php:7.4-fpm-alpine

# ADD ./docker/php/www.conf /usr/local/etc/php-fpm.d/www.conf

# RUN addgroup -g 1000 php_docker && adduser -G php_docker -g php_docker -s /bin/bash -D php_docker
# RUN apk update && apk add bash

# RUN mkdir -p /var/www/html

# RUN chown php_docker:php_docker /var/www/html

# WORKDIR /var/www/html

# ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

# RUN chmod +x /usr/local/bin/install-php-extensions && sync 

# RUN docker-php-ext-install pdo pdo_mysql
# RUN install-php-extensions gd
