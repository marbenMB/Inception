#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /bin/wp

wp core download --path=/var/www/html --allow-root

touch /var/www/html/wp-config.php

cat /var/www/html/wp-config-sample.php > /var/www/html/wp-config.php

cd /var/www/html/

wp config set DB_NAME $M_DB_NAME --path=/var/www/html/ --allow-root
wp config set DB_USER $M_USER_NAME --path=/var/www/html/ --allow-root
wp config set DB_PASSWORD $M_USER_PASS --path=/var/www/html/ --allow-root
wp config set DB_HOST $W_DB_HOST --path=/var/www/html/ --allow-root

wp config set WP_REDIS_HOST "redis" --path=/var/www/html/  --allow-root 
wp config set WP_REDIS_PORT "6379"  --path=/var/www/html/  --allow-root 

wp core install --url=$DOMAINE_NAME --title=$W_TITLE --admin_user=$W_ADMIN_U --admin_password=$W_ADMIN_P --admin_email=$W_ADMIN_E --path=/var/www/html --skip-email --allow-root

wp user create $USER_N $EMAIL --role=$ROLE --user_pass=$USER_P --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf

wp theme install Neve --activate --path=/var/www/html/ --allow-root

wp plugin install redis-cache --activate --path=/var/www/html/ --allow-root

wp plugin update --all --path=/var/www/html/ --allow-root

wp redis enable --path=/var/www/html/ --allow-root

exec "$@"