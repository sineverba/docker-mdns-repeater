FROM alpine:3.15.0

RUN apk update && apk upgrade --available

ADD mdns-repeater.c mdns-repeater.c

RUN apk add --no-cache build-base bash docker-cli \
    && gcc -O3 -o /bin/mdns-repeater mdns-repeater.c -DHGVERSION="\"1\"" \
    && apk del build-base \
    && rm -rf /var/cache/apk/* /tmp/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x entrypoint.sh
CMD [ "/entrypoint.sh" ]
