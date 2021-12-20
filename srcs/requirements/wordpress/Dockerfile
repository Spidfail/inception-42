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

RUN		apk update && apk upgrade && apk add openrc wget vim mariadb-client php7 php7-common \
		php7-fpm php7-json php7-zlib php7-xml php7-xmlwriter php7-simplexml php7-pdo php7-phar php7-openssl \
		php7-pdo_mysql php7-mysqli php7-session \
		php7-gd php7-iconv php7-mcrypt php7-gmp php7-zip \
		php7-curl php7-opcache php7-ctype php7-apcu \
		php7-intl php7-bcmath php7-dom php7-mbstring php7-xmlreader \
		&& mkdir /run/openrc \
		&& touch /run/openrc/softlevel \
		&& rc-update add php-fpm7 default \
		&& mkdir -p /var/www/html/wordpress \
		&& chown -R root:www-data /tmp \
		&& chown -R root:www-data /var/www/* \
		&& chmod -R 755 /var/www/html/* \
		&& rm /etc/php7/php-fpm.d/* \
		&& mv guhernan.conf /etc/php7/php-fpm.d/

WORKDIR		/var/www/html/wordpress

RUN		addgroup admin

CMD		["sh", "/tmp/launch_install_wp.sh"]
