FROM jenkins/jenkins

LABEL MAINTAINER="Daniel Grabert <docker@synec.de>"

USER root

# Update apt database
RUN apt-get update
# Perform dist-upgrade
RUN apt-get -y dist-upgrade

# Install deps for building nvm
RUN apt-get install -y rsync wget build-essential

USER root

RUN apt-get update -qq \
    && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common 
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

RUN apt-get update -qq

RUN apt-get install docker-ce=17.03.2~ce-0~debian-stretch kubectl -y

RUN usermod -aG docker jenkins

USER jenkins