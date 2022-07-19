FROM composer:2.3.4
ARG GROUP_ID
RUN addgroup -g $GROUP_ID php_docker && adduser -G php_docker -g php_docker -s /bin/sh -D php_docker

WORKDIR /var/www/html