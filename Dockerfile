FROM ubuntu:20.04

ADD *.sh /opt/

RUN chmod u+x /opt/*

ENV PATH="/opt:$PATH"
