FROM    debian:buster

WORKDIR /cad

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64

COPY tools/script.sh /cad

ENTRYPOINT [ "bash", "/cad/script.sh" ]

EXPOSE 8080

CMD [ "./cadvisor" ]