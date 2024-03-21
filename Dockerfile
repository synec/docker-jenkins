FROM jenkins/jenkins:jdk17

LABEL MAINTAINER="Daniel Grabert <docker@synec.de>"

USER root

RUN apt --allow-releaseinfo-change-suite update

RUN apt install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common chromium rsync gettext-base

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# RUN groupadd docker

RUN usermod -a -G 999 jenkins

ENV CHROME_BIN /usr/bin/chromium

USER jenkins
