FROM debian:bullseye

WORKDIR /db

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY /tools/script.sh	.

COPY /tools/maria.sql	.

ENTRYPOINT [ "bash", "./script.sh" ]

CMD [ "mysqld_safe", "--safe-mode" ]
