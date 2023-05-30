FROM debian:buster

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx

# COPY tools/index.html /var/www/html/index.html

# COPY tools/Style.css /var/www/html/

EXPOSE 80

CMD [ "nginx", "-g", "daemon off;" ]