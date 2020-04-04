FROM mapserver-benchmark:base
RUN apt-get  update && apt-get install -y --no-install-recommends nginx fcgiwrap libfcgi-dev
COPY ./fcgiwrap /etc/init.d/fcgiwrap
COPY ./default /etc/nginx/sites-enabled/
COPY ./start.sh /usr/local/bin/
COPY ./parse.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/start.sh
RUN mkdir -p /usr/lib/cgi-bin
RUN ln -s /usr/local/bin/mapserv /usr/lib/cgi-bin/mapserv
RUN chmod 777 /usr/lib/cgi-bin/mapserv
RUN chown www-data:www-data /usr/lib/cgi-bin -R
RUN rm /data/points.qix
WORKDIR /mnt
CMD ["/usr/local/bin/start.sh"]
