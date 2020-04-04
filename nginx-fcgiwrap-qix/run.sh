docker stop benchmark_nginx_fastcgi_qix
docker run --rm -it -u root --name benchmark_nginx_fastcgi_qix -p 80:80 \
  --mount type=bind,source="$(pwd)"/logs,target=/var/log/nginx \
  --mount type=bind,source="$(pwd)",target=/mnt \
  mapserver-benchmark:nginx_fastcgi_qix
