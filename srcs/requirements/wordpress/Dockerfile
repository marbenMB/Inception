FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

RUN apt install curl php-cli php-mysql -y

RUN apt install mariadb-client -y

COPY tools/script.sh /tmp

ENTRYPOINT [ "bash", "/tmp/script.sh" ]

CMD [ "tail", "-f" ]