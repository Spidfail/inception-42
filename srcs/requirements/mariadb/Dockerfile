# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: guhernan <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/14 15:30:42 by guhernan          #+#    #+#              #
#    Updated: 2021/12/15 19:54:28 by guhernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian

COPY	. /app

WORKDIR	/app

# # documentation :
# https://wiki.alpinelinux.org/wiki/MariaDB


RUN		apt update \
		&& apt-get install -y vim mariadb-server \
		&& service mariadb start \
		&& mariadb -u root < db.sql


CMD		["/bin/sh"]

		# && apk add openrc \
		# && mkdir /run/openrc\
		# && touch /run/openrc/softlevel \
		# && /etc/init.d/mariadb setup \
		# && rc-update add mariadb default
