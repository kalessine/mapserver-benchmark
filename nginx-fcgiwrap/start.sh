#!/bin/bash
service fcgiwrap start
chown www-data:www-data /var/run/fcgiwrap.socket
chmod 777 /var/run/fcgiwrap.socket
service nginx start
dialog --msgbox "Please open a browser and surf to localhost:81\nPan and zoom around the map for a long time to generate GetMap requests\nPress ENTER to generate test files to replay." 25 25
exec 3>&1;
result=$(dialog --inputbox "Please enter url to host to benchmark" 0 0 "http://172.17.0.1:80" 2>&1 1>&3);
exitcode=$?;
exec 3>&-;
parse.sh $result

