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

CREATE DATABASE wordpress_data;

CREATE USER 'guhernan'@'localhost' IDENTIFIED BY 'wordpress';
CREATE USER 'guhernan'@'%' IDENTIFIED BY 'wordpress';
GRANT ALL ON *.* TO 'guhernan'@'localhost' IDENTIFIED BY 'wordpress' WITH GRANT OPTION;
GRANT ALL ON *.* TO 'guhernan'@'%' IDENTIFIED BY 'wordpress' WITH GRANT OPTION;
FLUSH PRIVILEGES;


CREATE USER 'user'@'localhost' IDENTIFIED BY 'user';
CREATE USER 'user'@'%' IDENTIFIED BY 'user';
GRANT SELECT ON worpress_data.* TO 'user'@'localhost' IDENTIFIED BY 'user';
GRANT INSERT ON worpress_data.* TO 'user'@'localhost' IDENTIFIED BY 'user';
GRANT SELECT ON worpress_data.* TO 'user'@'%' IDENTIFIED BY 'user';
GRANT INSERT ON worpress_data.* TO 'user'@'%' IDENTIFIED BY 'user';
FLUSH PRIVILEGES;
