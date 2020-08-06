#!/bin/bash

if ! command -v pip
then
	echo "Installing pip..."
	if command -v python3
	then
		curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
		python3 get-pip.py
		rm get-pip.py
	else
		echo "ERROR: python3 not found"
		exit
	fi
fi

if command -v docker-compose
then
	echo "Successfully installed docker-compose"
	docker-compose up
else
	echo "Installing docker-compose..."
	sudo pip install docker-compose
fi
