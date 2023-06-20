#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /bin/wp

wp core download --path=/var/www/html --allow-root

cat wp-config-sample.php > wp-config.php

wp config set DB_NAME $M_DB_NAME --allow-root
wp config set DB_USER $M_USER_NAME --allow-root
wp config set DB_PASSWORD $M_USER_PASS --allow-root
wp config set DB_HOST $W_DB_HOST --allow-root

wp core install --url=$DOMAINE_NAME --title=$W_TITLE --admin_user=$W_ADMIN_U --admin_password=$W_ADMIN_P --admin_email=$W_ADMIN_E --path=/var/www/html --allow-root

wp user create $W_ADMIN_U $DOMAINE_NAME --role=$ROLE --user_pass=$W_ADMIN_P --allow-root

exec "$@"