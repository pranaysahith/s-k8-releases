#!/bin/bash -eux
apt-get -y install git
git clone https://github.com/filetrust/k8-reverse-proxy.git /tmp/repo
chmod 755 /tmp/repo/upwork-devs/noureddine-yassin/reverse-proxy-icap/install.sh
cd /tmp/repo/upwork-devs/noureddine-yassin/reverse-proxy-icap/
/tmp/repo/upwork-devs/noureddine-yassin/reverse-proxy-icap/install.sh