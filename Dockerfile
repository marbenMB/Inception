FROM debian:bullseye

RUN apt-get update

RUN apt-get upgrade -y

CMD ["tail", "-f"]