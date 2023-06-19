FROM debian:bullseye

WORKDIR /db

RUN apt update

RUN apt upgrade -y

RUN apt install -y mariadb-server

COPY /tools/script.sh	.

COPY /tools/maria.sql	.

# Bind Mount /var/lib/mysql

ENTRYPOINT [ "bash", "./script.sh" ]

CMD [ "mysqld_safe", "--safe-mode" ]
