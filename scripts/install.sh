#!/bin/bash
SSH_USER=${SSH_USERNAME:-user}
DEBIAN_FRONTEND=noninteractive

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose


