FROM jenkins/jenkins:jdk11

LABEL MAINTAINER="Daniel Grabert <docker@synec.de>"

USER root

RUN apt --allow-releaseinfo-change-suite update

RUN apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common chromium rsync

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

RUN apt update

RUN apt install kubectl -y

RUN groupadd -g 999 docker

RUN usermod -a -G docker jenkins

# RUN usermod -aG docker jenkins

ENV CHROME_BIN /usr/bin/chromium

USER jenkins
