FROM php:7.1-cli

RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-install bcmath

RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y supervisor
RUN apt-get install -y mysql-client
RUN apt-get install -y python
RUN apt-get install -y swftools
RUN apt-get install -y netcat-openbsd

RUN ln -s /usr/bin/nodejs /usr/bin/node

CMD supervisord -n -c /etc/supervisor/supervisord.conf
