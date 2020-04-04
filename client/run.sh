docker stop client
docker run --rm -it -u root --name client -p 81:1234 mapserver-benchmark:client
