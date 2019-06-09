FROM jleoshao/iotemn

ENV VERSION 0.1

COPY entrypoint.sh /usr/local/bin/iotemn.sh

ENTRYPOINT ["/usr/local/bin/iotemn.sh"]
