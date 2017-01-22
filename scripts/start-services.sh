#!/bin/bash
[ -e /var/run/redis_6379.pid ] && service redis_6379 stop 
[ -e /var/run/redis_6379.pid ] && rm /var/run/redis_6379.pid
service redis_6379 start
service mongod start
mailcatcher --smtp-ip=0.0.0.0 --http-ip=0.0.0.0
echo "waiting 5 seconds for the services can get ready..."
sleep 5
