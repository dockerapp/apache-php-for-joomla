FROM php:5.6-apache
MAINTAINER dockerapp

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libxml2-dev \
	&& apt-get install -y zip unzip php5-curl php5-gd php5-mysql php5-mcrypt php5-json  \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd ctype dom iconv mbstring mysqli session xml xmlreader xmlwriter zip

VOLUME /var/www/html

CMD ["apache2-foreground"]
