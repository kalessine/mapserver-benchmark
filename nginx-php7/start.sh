#!/bin/bash
service nginx start
service php7.2-fpm start
dialog --msgbox "Press ENTER for the server to stop." 25 25

