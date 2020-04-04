#!/bin/bash
echo $1
exec 2>>"/data/siege/$1.log"
exec >>/data/siege/hits.log
siege -c 20 -i -f /data/siege/log.log -t 600s -v -b  
