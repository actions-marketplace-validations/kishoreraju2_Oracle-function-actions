FROM alpine:3.10

RUN apk --no-cache add curl bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]