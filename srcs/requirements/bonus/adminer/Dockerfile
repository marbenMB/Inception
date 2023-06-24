FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y php php-mysql wget

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/index.php

EXPOSE 8081

CMD ["php", "-S", "0.0.0.0:8081", "-t", "/var/www/html"]