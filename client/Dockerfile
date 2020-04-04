FROM mapserver-benchmark:base
WORKDIR /data
RUN apt-get  update && apt-get install -y --no-install-recommends curl
RUN curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh
RUN /bin/bash /data/nodesource_setup.sh
RUN apt-get install -y nodejs 
COPY ./start.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/start.sh
RUN mkdir -p /usr/lib/cgi-bin
COPY ./ /data
WORKDIR /data
RUN npm install
CMD ["/usr/local/bin/start.sh"]
