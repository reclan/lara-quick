FROM php:7.4-apache

RUN apt update
# RUN apt install mbstring mysql-client php-xml

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
COPY start-apache /usr/local/bin
RUN chmod +x /usr/local/bin/start-apache

RUN a2enmod rewrite

COPY src/ /var/www
RUN chown -R www-data:www-data /var/www

EXPOSE 80

CMD ["start-apache"]

