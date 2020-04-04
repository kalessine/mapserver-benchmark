#!/bin/bash
service fcgiwrap start
chown www-data:www-data /var/run/fcgiwrap.socket
chmod 777 /var/run/fcgiwrap.socket
service nginx start
dialog --msgbox "Press ENTER to shutdown server." 25 25
