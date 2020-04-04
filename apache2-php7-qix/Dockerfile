FROM mapserver-benchmark:base
RUN apt-get  update && apt-get install -y --no-install-recommends apache2 nano libapache2-mod-php php7.2-fpm
COPY ./000-default.conf /etc/apache2/sites-enabled/
COPY ./start.sh /usr/local/bin/
COPY ./service.php /var/www/html/
RUN ln -s /etc/apache2/mods-available/php7.2.conf /etc/apache2/conf-enabled/
RUN ln -s /etc/apache2/mods-available/php7.2.load /etc/apache2/mods-enabled/
RUN rm /etc/apache2/mods-enabled/mpm_event.load
RUN rm /etc/apache2/mods-enabled/mpm_event.conf
RUN echo "extension=php_mapscript.so">>/etc/php/7.2/apache2/php.ini
RUN chmod +x /usr/local/bin/start.sh
RUN echo "ServerName localhost" >>/etc/apache2/apache2.conf
WORKDIR /mnt
CMD ["/usr/local/bin/start.sh"]
