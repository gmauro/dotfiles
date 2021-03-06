FROM gmauro/ansible:2.6_ubuntu18.04
MAINTAINER Gianmauro Cuccuru <gmauro@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN git clone --recursive https://github.com/gmauro/dotfiles \
 && cd dotfiles \
 && mkdir -p roles \
 && echo "test-password" > .vault-pass.txt \
 &&	ansible-galaxy install -p roles -r requirements.yml \
 && ansible-playbook main.yml --extra-vars "ssh_setup=false"


