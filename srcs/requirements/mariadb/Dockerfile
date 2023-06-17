FROM debian:bullseye

RUN apt update

RUN apt upgrade -y

RUN apt install -y mariadb-server

COPY /tools/maria.sql	/var

COPY /tools/script.sh	/var

CMD [ "bash", "/var/script.sh" ]
