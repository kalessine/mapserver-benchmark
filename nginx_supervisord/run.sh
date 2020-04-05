docker stop benchmark_nginx_supervisord
docker run --rm -it -u root --name benchmark_nginx_supervisord -p 80:80 \
  --mount type=bind,source="$(pwd)",target=/mnt \
  mapserver-benchmark:nginx_supervisord
