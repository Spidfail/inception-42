# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: guhernan <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/15 13:48:20 by guhernan          #+#    #+#              #
#    Updated: 2021/12/15 16:24:33 by guhernan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

COPY	. /tmp

WORKDIR	/tmp

RUN		apt-get -y update && apt-get -y upgrade \
		&& apt-get install -y vim openssl curl ca-certificates nginx snapd \
		&& mv nginx.conf /etc/nginx/nginx.conf \
		&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/guhernan.42.fr.key -out /etc/ssl/certs/guhernan.42.fr.pem \
		-subj "/C=Fr/CN=guhernan.42.fr/ST=Rhone-Alpes/L=Lyon"

# nginx location : /etc/nginx -> nginx.conf
# set TLS v1.3 :
# # nginx.conf : remove : TLSv1.1 [l.57] 
# # add : # TLS 1.3 only
# # ssl_protocols TLSv1.3;
# # ssl_prefer_server_ciphers off;
# # reload nginx

CMD ["nginx", "-g", "daemon off;"]
