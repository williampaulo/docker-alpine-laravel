FROM php:7.2-fpm-alpine
LABEL MAINTAINER="Niels van Doorn <n.van.doorn@outlook.com>"


RUN apk --update add wget \
  curl \
  git \
  grep \
  nginx \
  build-base \
  postgresql-dev \
  libmemcached-dev \
  libmcrypt-dev \
  libxml2-dev \
  zlib-dev \
  autoconf \
  cyrus-sasl-dev \
  libgsasl-dev \
  supervisor

RUN pecl channel-update pecl.php.net \
    && pecl install memcached mcrypt-1.0.1 \
    && docker-php-ext-enable memcached \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install pgsql mysqli mbstring pdo pdo_mysql pdo_pgsql tokenizer xml

RUN rm /var/cache/apk/* && \
    mkdir -p /var/www

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]
