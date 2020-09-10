#!/bin/bash
SSH_USER=${SSH_USERNAME:-user}
DEBIAN_FRONTEND=noninteractive

sudo apt-get update && sudo apt-get install curl git -y

curl https://get.docker.com -o /tmp/docker-installer.sh
chmod +x /tmp/docker-installer.sh
sudo /tmp/docker-installer.sh

sudo systemctl enable --now docker
sudo usermod -aG docker $1

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

rm VBoxGuest*.iso
sudo apt autoclean
sudo apt clean all
