#!/bin/bash

if ! command -v docker
then
	# REMOVE DOCKER INSTALLATION
	#sudo dnf remove docker \
        #          docker-client \
        #          docker-client-latest \
        #          docker-common \
        #          docker-latest \
        #          docker-latest-logrotate \
        #          docker-logrotate \
        #          docker-selinux \
        #          docker-engine-selinux \
        #          docker-engine
	# SET UP THE REPO
	sudo dnf -y install dnf-plugins-core
	sudo dnf config-manager \
	    --add-repo \
	    https://download.docker.com/linux/fedora/docker-ce.repo
	# INSTALL THE DOCKER ENGINE
	sudo dnf install docker-ce docker-ce-cli containerd.io
	# START DOCKER
	sudo systemctl start docker
	# VERIFY DOCKER
	sudo docker run hello-world
fi

if ! grep -q "docker" /etc/group
then
	sudo groupadd docker
	sudo gpasswd -a $USER docker
fi

## UNCOMMENT ANY FOR CONTAINER EXAMPLE

# HELLO WORLD CONTAINER
#docker run fedora /bin/echo 'Hello World'

# TERMINAL CONTAINER
#docker run -i -t --rm fedora /bin/bash

# DAEMON CONTAINER
#docker run --name daemon -d ubuntu /bin/sh -c "while true; do echo $(date); sleep 1; done"
# CHECK DAEMON CONTAINER
#docker logs -f daemon
# STOP DAEMON CONTAINER
#docker stop daemon
# START DAEMON CONTAINER
#docker start daemon
# REMOVE DAEMON CONTAINER
#docker rm daemon

# LIST CONTAINERS
#docker ps -a

# RESTART MOST RECENT CONTAINER
#docker start $(docker ps -q -l)

# REMOVE ALL CONTAINERS
#docker rm -f $(docker ps -aq)

if ! command -v pip
then
	if command -v python3
	then
		curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
		python3 get-pip.py
		rm get-pip.py
	fi
fi

echo "Installing docker-compose..."
sudo pip install docker-compose
