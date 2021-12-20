#!/bin/sh
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/bin/wp
wp cli update
wp core download --path=/var/www/html/wordpress --allow-root
wp core config --path=/var/www/html/wordpress --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --dbprefix=wp_ --allow-root
wp core install --path=/var/www/html/wordpress --url="motpresse.com" --title="Mot PReSSe" --admin_user="guhernan" --admin_password="wordpress" --admin_email="monemail@email.com" --allow-root
