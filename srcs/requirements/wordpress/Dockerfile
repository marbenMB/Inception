FROM debian:bullseye

WORKDIR /mount

RUN apt update

RUN apt upgrade -y

RUN apt install php-fpm -y

RUN apt install curl -y

EXPOSE 9000

CMD [ "tail", "-f" ]