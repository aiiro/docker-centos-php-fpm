# docker-centos-php-fpm

## Usage
```
$ docker run -d -v /data --name=php-data busybox
$ docker run -d --volumes-from php-data --name php-fpm aiiro/centos-php-fpm:latest
```
