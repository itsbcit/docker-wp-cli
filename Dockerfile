FROM php:7-alpine

LABEL maintainer="jesse@weisner.ca"

ENV PAGER more
ENV RUNUSER none
ENV HOME /application

RUN docker-php-ext-install mysqli

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN apk add --no-cache \
        tini

# Add docker-entrypoint script base
ENV DE_VERSION v1.0
ADD https://github.com/itsbcit/docker-entrypoint/releases/download/${DE_VERSION}/docker-entrypoint.tar.gz /docker-entrypoint.tar.gz
RUN tar zxvf docker-entrypoint.tar.gz && rm -f docker-entrypoint.tar.gz
RUN chmod -R 555 /docker-entrypoint.*

# Allow resolve-userid.sh script to run
RUN chmod 664 /etc/passwd /etc/group

RUN mkdir /application && chmod 775 /application
VOLUME /application

WORKDIR /application

ENTRYPOINT ["/sbin/tini", "--", "/docker-entrypoint.sh"]
CMD ["tail", "-f", "/dev/null"]
