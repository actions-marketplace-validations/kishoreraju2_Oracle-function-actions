FROM oraclelinux:8-slim


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]