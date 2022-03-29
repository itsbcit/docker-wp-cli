FROM bcit.io/php-fpm:7.4-centos-latest

RUN yum install -y less \
  && rm -rf /var/cache/yum

ADD https://github.com/wp-cli/wp-cli/releases/download/v2.5.0/wp-cli-2.5.0.phar \
    /usr/local/bin/wp
RUN chmod 555 /usr/local/bin/wp \
 && adduser -D -h /application wordpress


CMD ["init-loop"]
