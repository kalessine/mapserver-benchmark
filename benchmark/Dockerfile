FROM mapserver-benchmark:base
RUN apt-get  update && apt-get install -y --no-install-recommends siege
RUN mkdir -p /data/siege
COPY ./start.sh /usr/local/bin/
CMD ["/usr/local/bin/start.sh","$1"]
