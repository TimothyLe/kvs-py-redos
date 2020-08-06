#!/bin/bash

if ! command -v docker
then
	echo "ERROR: docker is not found"
	exit
fi

# CREATE NGINX CONTAINER
docker run -d --name "kvs-region-map" -p 8080:80 -v $(pwd):/usr/share/nginx/html:ro nginx:latest

# INSPECT CONTAINER
#docker inspect kvs-region-map
