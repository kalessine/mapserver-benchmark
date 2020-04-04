docker stop benchmark_nginx_php7_qix
docker run --rm -it -u root --name benchmark_nginx_php7_qix -p 80:80 \
  mapserver-benchmark:nginx_php7_qix
