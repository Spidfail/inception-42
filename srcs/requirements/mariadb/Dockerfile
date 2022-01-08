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

RUN		apt -y update && apt -y upgrade \
		&& apt-get install -y vim mariadb-server mariadb-client \
		&& mv ./my.cnf /etc/mysql/ \
		&& service mysql start \
		&& mysql -u root < db.sql \
		&& rm db.sql


CMD		["mysqld", "--user=root"]
