# origin
FROM alpine

LABEL AUTHOR="AnthonyMSen"

RUN set -ex \
  && apk update && apk upgrade \
  && apk add --no-cache tzdata moreutils git python3 python3-dev py3-pip g++ gcc libxslt-dev python3-dev openssl-dev jpeg-dev zlib-dev \
  && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo "Asia/Shanghai" > /etc/timezone

RUN git clone https://github.com/AnthonyMSen/MMT.git /MMT \
  && cd /MMT \
  && pip3 install -r /MMT/requirements.txt \
  && python3 manage.py migrate \
  && python3 manage.py makemigrations \
  && python3 manage.py migrate \
  && rm -r ~/.cache

COPY ./docker/docker_entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /MMT

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "/bin/sh" ]
