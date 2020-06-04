FROM python:3.8-slim

WORKDIR /ansible-exercise

ENV ANSIBLE_CONFIG=/ansible-exercise/ansible.cfg

RUN set -ex \
    && apt-get update \
    && apt-get install openssh-client git vim emacs -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --no-cache-dir ansible

COPY ssh/config ssh/id_ecdsa /root/.ssh/

RUN set -ex \
    && chmod 700 /root/.ssh \
    && chmod 600 /root/.ssh/*

VOLUME [ "/ansible-exercise" ]

ENTRYPOINT [ "sh", "-c", "while sleep 1000; do :; done" ]
CMD [ "" ]