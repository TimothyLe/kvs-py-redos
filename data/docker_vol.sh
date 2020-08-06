#!/bin/bash

if ! command -v docker
then
	echo "ERROR: docker not found"
	exit
fi

# CREATE IMAGE THAT FETCHES WEBSITE DOCUMENTS TO STORE
docker build . -t kvs-curl-vol

# CHECK IMAGES
docker images

# CREATE AND RUN CONTAINER FROM IMAGE
docker run --rm -v $(pwd)/vol:/data/:rw kvs-curl-vol

# VIEW ANOTHER WEBSITE
#WEBSITE="http://timothyleggo.com/"
#docker run --rm -e SITE_URL=$WEBSITE -v $(pwd)/vol:/data/:rw kvs-curl-vol

# VIEW WEBSITE VOL
# cat ./vol/results
