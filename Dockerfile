FROM oraclelinux:8-slim

RUN yum install -y python36
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]