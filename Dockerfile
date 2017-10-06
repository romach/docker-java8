# docker build -t romach007/java8:1.0.0 -t romach007/java8:latest .
# docker run -id --name java8 romach007/java8
# docker exec -it ubuntu /bin/bash
FROM ubuntu:16.04
LABEL maintainer="romach007@gmail.com"

# create user
RUN adduser --disabled-password --gecos "" user

# update packages
RUN apt-get update

# install curl
RUN apt-get install -y curl

# add package to use add-apt-repository command
RUN apt-get install -y software-properties-common

# add ppa:webupd8team/java repository
RUN add-apt-repository -y ppa:webupd8team/java

# update packages
RUN apt-get update

# accept Oracle license
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections

# install java 8
RUN apt-get install -y oracle-java8-installer