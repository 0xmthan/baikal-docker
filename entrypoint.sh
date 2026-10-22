#!/bin/sh
chown -R www-data:www-data /var/www/baikal/config /var/www/baikal/Specific
php-fpm -D
nginx -g 'daemon off;'
