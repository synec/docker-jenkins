FROM jenkins/jenkins:latest

LABEL MAINTAINER="Daniel Grabert <docker@synec.de>"

USER root

RUN apt update

RUN apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common chromium rsync

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN add-apt-repository \
   "deb http://apt.kubernetes.io/ \
   kubernetes-xenial \
   main"

RUN apt update

RUN apt install docker-ce=18.06.3~ce~3-0~debian kubectl -y

RUN usermod -aG docker jenkins

ENV CHROME_BIN /usr/bin/chromium

USER jenkins
