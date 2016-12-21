FROM python:2.7-alpine

RUN mkdir -p /var/lib/mantis

RUN apk update && apk add \
	git \
	sqlite \
	g++ \
	bash

RUN git clone https://github.com/madgik/madis.git /var/lib/mantis

RUN pip install --no-cache-dir apsw

RUN mkdir -p /usr/app/src
VOLUME /usr/app/src/data
WORKDIR /usr/app/src

COPY projects.sql /usr/app/src/projects.sql
COPY projects.db.gz /usr/app/src/projects.db.gz
RUN gunzip /usr/app/src/projects.db.gz

CMD ["/bin/sh", "-c", "for i in /usr/app/src/data/*.xml;do cat $i | python /var/lib/mantis/src/mexec.py -f /usr/app/src/projects.sql -d /usr/app/src/projects.db > $i.json;done"]
