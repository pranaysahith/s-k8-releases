sudo DEBIAN_FRONTEND=noninteractive apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
# add the docker gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn apt-key add -

# Add the Docker repository to your apt sources list.
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update your sources
sudo apt-get update

# Install.
sudo DEBIAN_FRONTEND=noninteractive apt-get install docker-ce docker-ce-cli -y
