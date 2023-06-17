FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

RUN apt install mariadb-server -y

COPY maria.sql /var

COPY script.sh /var

CMD ["bash", "/var/script.sh"]