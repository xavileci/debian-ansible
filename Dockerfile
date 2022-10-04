FROM docker.io/arm64v8/debian:latest

RUN apt-get update ; echo OK && \
    apt-get dist-upgrade -y && \
    apt install -y sshpass ansible ansible-lint ansible-mitogen vim-tiny && \
    echo 'export alias vim=vim.tiny' >> /etc/bash.bashrc && \
    echo '[defaults]' > /etc/skel/ansible.cfg && \
    echo 'host_key_checking = false' >> /etc/skel/ansible.cfg && \
    useradd --home-dir /home/ansible --create-home --shell /bin/bash ansible

USER ansible
WORKDIR /home/ansible
