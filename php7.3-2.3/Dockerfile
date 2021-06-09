FROM bcit/openshift-php-fpm:7.3-latest-latest

ENV RUNUSER wordpress
ENV PAGER more

ADD https://github.com/wp-cli/wp-cli/releases/download/v2.3.0/wp-cli-2.3.0.phar \
    /usr/local/bin/wp
RUN chmod 555 /usr/local/bin/wp \
 && adduser -D -h /application wordpress

USER wordpress

CMD ["init-loop"]
