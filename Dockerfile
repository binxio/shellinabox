FROM alpine:latest

RUN apk --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ add shellinabox

EXPOSE 4200

ENV PORT=4200

ENTRYPOINT [ "/bin/sh", "-xc" ]

CMD ["shellinaboxd -s '/:root:root:/root:/bin/sh' --port ${PORT} --disable-ssl"]
