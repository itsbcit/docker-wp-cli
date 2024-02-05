FROM bcit.io/php-fpm:8.2-latest

# RUN yum install -y less \
#   && rm -rf /var/cache/yum

ADD https://github.com/wp-cli/wp-cli/releases/download/v2.9.0/wp-cli-2.9.0.phar \
    /usr/local/bin/wp
RUN chmod 555 /usr/local/bin/wp \
 && adduser -D -h /application wordpress \
 && adduser wordpress root

USER wordpress
CMD ["init-loop"]
