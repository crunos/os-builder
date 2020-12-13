ARG     BASE_IMAGE=alpine:latest
ARG     LXKIT_IMAGE=crunos/linuxkit:latest

FROM    $BASE_IMAGE AS dockerbuild

WORKDIR /tmp

RUN     wget -O docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-20.10.0.tgz

RUN     tar -xzf docker.tgz


FROM    $LXKIT_IMAGE

RUN     apk --update --no-cache add \
        qemu-system-x86_64 \
        qemu-img
        
COPY    --from=dockerbuild /tmp/docker/docker /usr/bin/
COPY	files/ /

ENTRYPOINT      [ "/usr/bin/entrypoint", "/usr/bin/linuxkit" ]
