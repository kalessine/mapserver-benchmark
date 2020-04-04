FROM mapserver-benchmark:base
RUN apt-get  update && apt-get install -y --no-install-recommends nginx php7.2 php7.2-fpm
COPY ./default /etc/nginx/sites-enabled/
COPY ./start.sh /usr/local/bin/
RUN mkdir /data/www
COPY ./service.php /data/www/
RUN chmod a+x /usr/local/bin/start.sh
RUN echo "extension=php_mapscript.so">>/etc/php/7.2/fpm/php.ini
WORKDIR /data
CMD ["/usr/local/bin/start.sh"]
