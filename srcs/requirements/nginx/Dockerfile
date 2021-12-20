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

FROM	alpine

COPY	. /app

RUN		apk update && apk upgrade \
		&& apk add openrc vim openssl curl ca-certificates nginx

# nginx location : /etc/nginx -> nginx.conf
# set TLS v1.3 :
# # nginx.conf : remove : TLSv1.1 [l.57] 
# # add : # TLS 1.3 only
# # ssl_protocols TLSv1.3;
# # ssl_prefer_server_ciphers off;
# # reload nginx

CMD		/bin/sh