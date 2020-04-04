docker stop benchmark_nginx_php7
docker run --rm -it -u root --name benchmark_nginx_php7 -p 80:80 \
  mapserver-benchmark:nginx_php7
