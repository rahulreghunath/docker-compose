FROM nginx:stable-alpine

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./default.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /var/www/html

RUN addgroup -g 1000 php_docker && adduser -G php_docker -g php_docker -s /bin/sh -D php_docker

RUN chown php_docker:php_docker /var/www/html