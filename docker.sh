#!/bin/bash

set -x

#To install docker through Script:

#Run the following command to uninstall all conflicting packages:

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Installation steps for Docker:

#1. Set up Docker's apt repository.

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "Step-1 of setting up docker apt repository is done."

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#2. Install the Docker packages.

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo " Step-2 of Docker Packages installation is done."

#Manage Docker as a non-root user:
#To create the docker group and add your user:

#1.Create the docker group.

sudo groupadd docker

#2.Add your user to the docker group.

sudo usermod -aG docker $(whoami)
 
newgrp docker

#3.Verify that you can run docker commands without sudo and Verify that the Docker Engine installation is successful by running the hello-world image.

docker run hello-world

echo " hello-world image is running successfully:"










