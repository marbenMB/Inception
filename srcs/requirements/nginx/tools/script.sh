#!/bin/bash

openssl req -x509 -newkey rsa:2048 -nodes -keyout $KEY -out $CERTIF -days 365 -subj "/C=MO/L=MA/O=1337/OU=student/CN=mbenbajj.1337.ma"


touch /etc/nginx/sites-available/wordpress

echo "server 
		{
			listen [::]:443 ssl;
			listen 443 ssl;

			root /var/www/html;
			index index.php;
			server_name	mbenbajj.1337.ma;

			ssl_certificate $CERTIF;
    		ssl_certificate_key $KEY;
    		ssl_protocols TLSv1.2;

			location ~ [^/]\.php(/|$) { 
				try_files \$uri =404;
				fastcgi_pass c_wordpress:9000;
				include fastcgi_params;
				fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
				index index.html;
        	}
		}" > /etc/nginx/sites-available/wordpress

exec "$@"