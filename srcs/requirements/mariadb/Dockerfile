FROM debian:buster

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY /tools/script.sh	/

CMD [ "bash", "script.sh" ]
