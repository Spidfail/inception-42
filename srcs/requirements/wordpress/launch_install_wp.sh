#!/bin/sh

if ! command -v wp &> /dev/null
then
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/bin/wp
	wp cli update
	wp core download --path=/var/www/html/wordpress --allow-root
	wp core config --path=/var/www/html/wordpress --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbprefix=wp_ --allow-root
	wp core install --path=/var/www/html/wordpress --url="guhernan.42.fr" --title="Mot PReSSe" --admin_user=$WORDPRESS_DB_USER --admin_password=$WORDPRESS_DB_PASSWORD --admin_email="monemail@email.com" --allow-root
fi

exec php-fpm7 -F -R