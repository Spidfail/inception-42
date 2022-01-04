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

FROM	debian:buster

COPY	. /app

WORKDIR	/app

# # documentation :
# https://wiki.alpinelinux.org/wiki/MariaDB


RUN		apt -y update && apt -y upgrade \
		&& apt-get install -y vim mariadb-server mariadb-client

RUN		cp ./my.cnf /etc/mysql/
RUN		service mysql start \
		&& mysql -u root < db.sql


CMD		["mysqld", "--user=root"]
#CMD		["/bin/bash"]

		# && apk add openrc \
		# && mkdir /run/openrc\
		# && touch /run/openrc/softlevel \
		# && /etc/init.d/mariadb setup \
		# && rc-update add mariadb default
