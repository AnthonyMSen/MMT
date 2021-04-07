# origin
FROM alpine

LABEL AUTHOR="AnthonyMSen"

RUN set -ex \
  && apk update && apk upgrade \
  && apk add --no-cache tzdata moreutils git python3 python3-dev py3-pip g++ gcc libxslt-dev python3-dev openssl-dev jpeg-dev zlib-dev \
  && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo "Asia/Shanghai" > /etc/timezone

RUN git clone https://github.com/AnthonyMSen/MMT.git /MMT

RUN cd /MMT \
  && git checkout master \
  && pip3 install --no-cache-dir -r /MMT/requirements.txt

RUN cd /MMT \
  && python3 manage.py migrate \
  && python3 manage.py makemigrations \
  && python3 manage.py migrate

COPY ./docker/docker_entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker_entrypoint.sh

WORKDIR /MMT

ENTRYPOINT ["docker_entrypoint.sh"]

CMD [ "/bin/sh" ]
