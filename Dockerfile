FROM php:8.3-cli

ENV USER=dev

COPY . /app
WORKDIR /app
COPY --from=composer /usr/bin/composer /usr/bin/composer
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/
RUN install-php-extensions zip mbstring sockets openssl

RUN apt-get -y update
RUN apt-get -y install git zip

RUN adduser ${USER}

USER ${USER}

ENTRYPOINT ["tail", "-f", "/dev/null"]