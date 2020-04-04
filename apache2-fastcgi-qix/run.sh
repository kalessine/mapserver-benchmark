docker stop benchmark_apache2_fastcgi_qix
docker run --rm -it -u root --name benchmark_apache2_fastcgi_qix -p 80:80 \
  --mount type=bind,source="$(pwd)",target=/mnt \
  mapserver-benchmark:apache2_fastcgi_qix
