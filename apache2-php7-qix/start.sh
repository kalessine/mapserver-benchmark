#!/bin/bash
a2dismod mpm_event
a2enmod mpm_prefork
service apache2 start
dialog --msgbox "Press ENTER to shutdown server." 25 25

