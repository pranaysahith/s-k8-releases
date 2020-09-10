#!/bin/bash
SSH_USER=${SSH_USERNAME:-vagrant}

sudo apt-get update && sudo apt-get install curl git -y

sudo apt install docker.io -y

sudo systemctl start docker
sudo systemctl enable docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose


