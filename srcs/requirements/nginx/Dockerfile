FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y nginx

RUN apt-get install -y openssl

COPY tools/script.sh /

COPY tools/nginx.conf /etc/nginx/

EXPOSE 443

ENTRYPOINT [ "bash", "./script.sh" ]

CMD [ "nginx" , "-g" , "daemon off;" ]