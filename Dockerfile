FROM oraclelinux:8-slim

yum install -y python36
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]