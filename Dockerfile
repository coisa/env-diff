FROM composer
WORKDIR /usr/src
RUN composer require tekill/env-diff
WORKDIR /usr/local/src
ENTRYPOINT [ "/usr/src/vendor/bin/env-diff" ]
CMD [ "diff" ]
