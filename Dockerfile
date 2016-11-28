FROM aiiro/centos:latest

ADD container-files/etc/yum.repos.d/* /etc/yum.repos.d/

# Add user and group: www:www
RUN groupadd -r www && useradd -r -g www www

# Install tools
RUN yum -y install gcc tar MarpaDB-client openssl-devel readline-devel zlib-devel

RUN rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y update \
    && yum -y --enablerepo=remi-php70 install \
            php \
            php-ast \
            php-bcmath \
            php-cli \
            php-common \
            php-devel \
            php-fpm \
            php-gd \
            php-gmp \
            php-intl \
            php-json \
            php-mbstring \
            php-mcrypt \
            php-mysqlnd \
            php-opcache \
            php-pdo \
            php-pear \
            php-pecl-imagick \
            php-pecl-memcached \
            php-pecl-uploadprogress \
            php-pecl-uuid \
            php-pecl-zip \
            php-process \
            php-pspell \
            php-xml \
            php-xdebug \

     && echo 'PHP installed.' \

     # Disable SSH strict host key checking.
     && echo -e "StrictHostKeyChecking no" >> /etc/ssh/ssh_config \

     # Install Composer
     && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
     && chown www /usr/bin/composer && composer --version \

     && yum clean all && rm -rf /tmp/yum*

ADD container-files /

ENV \
  GENERATE_PHPINFO=false

EXPOSE 9000