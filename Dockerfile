FROM php:7.1-cli

RUN docker-php-ext-install pdo_mysql

RUN docker-php-ext-install bcmath

RUN echo 'deb http://mirrors.aliyun.com/debian/ jessie main non-free contrib' > /etc/apt/sources.list \
    && echo 'deb http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib' >> /etc/apt/sources.list \
    && echo 'deb-src http://mirrors.aliyun.com/debian/ jessie main non-free contrib' >> /etc/apt/sources.list \
    && echo 'deb-src http://mirrors.aliyun.com/debian/ jessie-proposed-updates main non-free contrib' >> /etc/apt/sources.list

RUN apt-get update \
    && apt-get install -y nodejs supervisor

RUN ln -s /usr/bin/nodejs /usr/bin/node

CMD supervisord -n -c /etc/supervisor/supervisord.conf
