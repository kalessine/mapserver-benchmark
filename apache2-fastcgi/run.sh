docker stop benchmark_apache2_fastcgi
docker run --rm -it -u root --name benchmark_apache2_fastcgi -p 80:80 \
  --mount type=bind,source="$(pwd)",target=/mnt \
  mapserver-benchmark:apache2_fastcgi
