-- **************************************************************************** #
--                                                                              #
--                                                         :::      ::::::::    #
--    db.sql                                             :+:      :+:    :+:    #
--                                                     +:+ +:+         +:+      #
--    By: guhernan <marvin@42.fr>                    +#+  +:+       +#+         #
--                                                 +#+#+#+#+#+   +#+            #
--    Created: 2021/12/15 18:08:46 by guhernan          #+#    #+#              #
--    Updated: 2021/12/15 18:08:47 by guhernan         ###   ########.fr        #
--                                                                              #
-- **************************************************************************** #

CREATE USER 'guhernan'@'localhost' IDENTIFIED BY 'guhernan';
GRANT ALL ON *.* TO 'guhernan'@'localhost' IDENTIFIED BY 'wordpress' WITH GRANT OPTION;
FLUSH PRIVILEGES;

CREATE DATABASE wordpress_data;
FLUSH PRIVILEGES;

CREATE USER 'user'@'localhost' IDENTIFIED BY 'user';
GRANT SELECT ON worpress_data.* TO 'user'@'localhost' IDENTIFIED BY 'user';
GRANT INSERT ON worpress_data.* TO 'user'@'localhost' IDENTIFIED BY 'user';
FLUSH PRIVILEGES;
