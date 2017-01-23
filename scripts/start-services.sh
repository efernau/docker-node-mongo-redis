#!/bin/bash
[ -e /var/run/redis_6379.pid ] && service redis_6379 stop 
[ -e /var/run/redis_6379.pid ] && rm /var/run/redis_6379.pid
service redis_6379 start
service mongod start
echo "waiting 5 seconds for the services can get ready..."
sleep 5
