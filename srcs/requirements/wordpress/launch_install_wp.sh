#!/bin/sh

if ! command -v wp &> /dev/null
then
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/bin/wp
	wp cli update
	wp core download --path=/var/www/html/wordpress --allow-root
	wp core config --path=/var/www/html/wordpress --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbprefix=wp_ --allow-root
	wp core install --path=/var/www/html/wordpress --url="guhernan.42.fr" --title="Mot Presse" --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email="monemail@email.com" --allow-root
	# Possible setup :	users can register with email address.
	# 			some configuration is required to make it works.
	#			For example : doesn't send email at this stage.
	wp option update users_can_register 1 --allow-root
	wp option update comment_registration 1 --allow-root
	wp user create user user@guhernan.42lyon.fr --role=subscriber --user_pass=user --user_registered=2022-01-07
fi

exec php-fpm7 -F -R
