FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install nginx -y

COPY tools/index.html /var/www/html/index.html

COPY tools/Style.css /var/www/html

CMD [ "nginx" , "-g" , "daemon off;" ]