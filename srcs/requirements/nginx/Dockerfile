FROM debian:buster

COPY About.html /var/www/html/index.html

COPY Style.css /var/www/html/

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx/

CMD [ "nginx", "-g", "daemon off;" ]