FROM bradrydzewski/base
MAINTAINER pepabo

USER root

RUN apt-get update && apt-get install php5-cli php-pear libmcrypt-dev
RUN curl -sL https://github.com/phpbrew/phpbrew/raw/master/phpbrew -o /usr/local/bin/phpbrew
RUN chmod +x /usr/local/bin/phpbrew

WORKDIR /home/ubuntu
USER ubuntu

ADD phpbrew.sh /etc/drone.d/
RUN phpbrew init && phpbrew update --old && phpbrew install 5.3.29 +default +mysql +mb
RUN echo "source ~/.phpbrew/bashrc\nphpbrew use 5.3.29" >> ~/.bashrc
