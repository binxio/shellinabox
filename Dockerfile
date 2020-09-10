FROM binxio/gcp-get-secret:0.3.1
FROM alpine:latest
 
COPY --from=0 /gcp-get-secret /usr/local/bin/
RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add shellinabox
RUN apk --no-cache add mysql-client

EXPOSE 4200

ENV PORT=4200

ENTRYPOINT [ "/bin/sh", "-xc" ]

CMD ["exec shellinaboxd -s '/:root:root:/root:/bin/sh' --port ${PORT} --disable-ssl"]
