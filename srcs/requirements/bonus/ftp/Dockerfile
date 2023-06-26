FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y

RUN apt install -y vsftpd

COPY ./tools/script.sh /tmp

ENTRYPOINT [ "bash", "/tmp/script.sh" ]

CMD [ "/usr/sbin/vsftpd" ]