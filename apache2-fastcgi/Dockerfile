FROM mapserver-benchmark:base
RUN apt-get  update && apt-get install -y --no-install-recommends apache2 nano libapache2-mod-fcgid
COPY ./000-default.conf /etc/apache2/sites-enabled/
COPY ./start.sh /usr/local/bin/
COPY ./serve-cgi-bin.conf /etc/apache2/conf-enabled/
RUN chmod +x /usr/local/bin/start.sh
RUN ln -s /usr/local/bin/mapserv /usr/lib/cgi-bin/mapserv
RUN ln -s /etc/apache2/mods-available/cgi.load /etc/apache2/mods-enabled/
RUN chmod 777 /usr/lib/cgi-bin/mapserv
RUN chown www-data:www-data /usr/lib/cgi-bin -R
RUN echo "ServerName localhost" >>/etc/apache2/apache2.conf
RUN rm /data/points.qix
WORKDIR /mnt
CMD ["/usr/local/bin/start.sh"]
