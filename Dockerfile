FROM jenkins/jenkins

LABEL MAINTAINER="Daniel Grabert <docker@synec.de>"

USER root

# Update apt database
RUN apt-get update
# Perform dist-upgrade
RUN apt-get -y dist-upgrade

# Install deps for building nvm
RUN apt-get install -y rsync wget build-essential

USER jenkins
