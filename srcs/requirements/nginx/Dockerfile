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

FROM	debian

COPY	. /tmp

WORKDIR	/tmp

RUN		apt-get -y update && apt-get -y upgrade \
		&& apt-get install -y vim openssl curl ca-certificates nginx \
		&& mv nginx.conf /etc/nginx/nginx.conf \
		&& addgroup --system --gid 101 nginx \
		&& adduser --system --disabled-login --ingroup nginx --no-create-home --home /nonexistent --gecos "nginx user" --shell /bin/false --uid 101 nginx

# nginx location : /etc/nginx -> nginx.conf
# set TLS v1.3 :
# # nginx.conf : remove : TLSv1.1 [l.57] 
# # add : # TLS 1.3 only
# # ssl_protocols TLSv1.3;
# # ssl_prefer_server_ciphers off;
# # reload nginx

CMD ["nginx", "-g", "daemon off;"]
