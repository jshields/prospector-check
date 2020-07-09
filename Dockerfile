FROM python:3.8.3-alpine

LABEL "maintainer"="Jacobi Petrucciani <jacobi@hackerrank.com>"

ADD requirements.txt /requirements.txt
ADD entrypoint.sh /entrypoint.sh
ADD github.py /github.py

RUN apk add gcc musl-dev git && \
    pip install -r requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
