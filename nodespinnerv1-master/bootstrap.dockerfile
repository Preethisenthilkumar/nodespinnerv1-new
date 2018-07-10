FROM alpine:3.7

WORKDIR /root
COPY . /root/
RUN ./genkp.docker.sh

###

FROM docker:dind

WORKDIR /root
COPY --from=0 /bin/genkp /bin/genkp
COPY ./bootstrap /root/
COPY ./ansible.docker.sh /
COPY ./entrypoint.sh /

RUN true \
 && /ansible.docker.sh \
 && rm -rf /var/cache/apk/*

ENTRYPOINT ["/entrypoint.sh"]

