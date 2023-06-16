FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

RUN apt-get install -y nginx

RUN apt-get install -y openssl

COPY tools/script.sh /

EXPOSE 443

CMD [ "bash", "script.sh" ]