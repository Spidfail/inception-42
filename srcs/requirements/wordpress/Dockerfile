# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: guhernan <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/15 14:33:38 by guhernan          #+#    #+#              #
#    Updated: 2021/12/16 14:30:59 by guhernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine

COPY	. /tmp

WORKDIR /tmp

# # documentation :
# https://wiki.alpinelinux.org/wiki/MariaDB

RUN		apk update && apk upgrade && apk add openrc wget vim php7 php7-fpm php7-opcache \
		php7-gd php7-mysqli php7-zlib php7-curl \
		&& mkdir /run/openrc \
		&& touch /run/openrc/softlevel \
		&& rc-update add php-fpm7 default \
		&& wget -P /tmp/ http://wordpress.org/latest.tar.gz \
		&& wget -P /tmp/ https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz \
		&& mkdir -p /var/www/html/wordpress \
		&& chown -R root:www-data /tmp \
		&& chown -R root:www-data /var/www/* \
		&& chmod -R 755 /var/www/html/* \
		&& tar xfvz /tmp/latest.tar.gz -C /var/www/html/wordpress --strip-components 1 \
		&& mv /tmp/wp-config.php /var/www/html/wordpress/

RUN		addgroup admin

CMD		/bin/sh
