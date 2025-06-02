FROM ubuntu:latest

RUN apt-get update && apt-get install -y wget unzip

ENV config=""
ENV comandLine=""

WORKDIR /tmp

RUN wget -O usque.zip https://github.com/Diniboy1123/usque/releases/download/v1.2.0/usque_1.2.0_linux_amd64.zip

RUN unzip usque.zip && \
    mv usque /usr/local/bin/usque && \
    chmod +x /usr/local/bin/usque && \
    rm usque.zip

RUN echo "$config" > /usr/local/bin/config.json

ENTRYPOINT ["/usr/local/bin/usque"]

CMD ["$comandLine"]
