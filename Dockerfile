FROM node
MAINTAINER efero <info@efero.de>
LABEL node="6.9.4" mongodb="3.2" redis="3.2.6"
ENV DEBIAN_FRONTEND=noninteractive


RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 \
  && echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.2 main" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list \
  && apt-get update \
  && apt-get install -y mongodb-org --no-install-recommends \
  && apt-get install -y build-essential tcl8.5 libsqlite3-dev ruby ruby-dev build-essential \
  && apt-get clean \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# redis
RUN wget http://download.redis.io/releases/redis-3.2.6.tar.gz \
 && tar xzf redis-3.2.6.tar.gz \
 && rm redis-3.2.6.tar.gz \
 && cd redis-3.2.6 \
 && make \
 && make install \
 && cd utils \
 && ./install_server.sh


RUN mkdir -p /scripts
COPY scripts/ /scripts/
EXPOSE 27017 6379 1080 1025
