FROM debian:bullseye

RUN apt-get -y update && apt-get upgrade -y

RUN apt-get install redis-server -y

COPY tools/script.sh /tmp

ENTRYPOINT [ "bash", "/tmp/script.sh" ]

CMD ["redis-server",  "--protected-mode", "no"]