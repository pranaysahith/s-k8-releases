### RELEASE CANDIDATE 1 OVA

Release Candidate 1 includes the completed/tested pieces of the Reverse Proxy project as a "docker-compose script" to run inside an standard Ubuntu 18.04 server OVA image. The completed pieces of this project so far are:

- Squid based reverse Proxy for a specific website.
- Two Way URL rewrite/ with the help of NGINX in front of Squid.
- SSL termination.
- ICAP integration (icap://gw-icap01.westeurope.azurecontainer.io/gw_rebuild)

- Download the OVA http://51.11.8.179:1234/glasswall-proxy.ova
- Import it to VirtualBox , open settings, choose the network for network adapter 2
- system credentials:
username: user
password: secret
- check the ip address of eth1, add it your hosts files as follows
  1.2.3.4 assets.publishing.service.gov.uk.glasswall-icap.com
  1.2.3.4 gov.uk.glasswall-icap.com
  1.2.3.4 www.gov.uk.glasswall-icap.com 



### Create OVA from https://github.com/filetrust/k8-reverse-proxy/tree/master/upwork-devs/noureddine-yassin/reverse-proxy-icap

**Prepare Environment**

- Install Git for Windows (Default Settings) https://gitforwindows.org/ - I propose to download and install Tortoisegit https://tortoisegit.org/download/
- Install Virtual Box (Default Settings, You can not use Hyper-V): https://download.virtualbox.org/virtualbox/6.1.14/VirtualBox-6.1.14-140239-Win.exe
  You can create a new Empty Virtual Machine and start it to see Bios - In this way you are sure that Hypervisor is running properly.
- Install Vagrant(Default Settings): https://releases.hashicorp.com/vagrant/2.2.10/vagrant_2.2.10_x86_64.msi
- Copy .exe from https://releases.hashicorp.com/packer/1.6.2/packer_1.6.2_windows_amd64.zip to c:\windows\system32

**Test Environment**

Run command prompt as an admin to test if everything is installed correctly
- mkdir c:\vagranttst
- cd c:\vagranttst
- vagrant box add ubuntu/bionic64
- vagrant init ubuntu/bionic64
- vagrant up
- vagrant ssh
- exit
- vagrant halt
- packer -version

**Build OVA**

- Clone Repository
- cd to repository Path
- packer build ova.json
- cd output
- vagrant box add myova ubuntu-18.04.1.box
- vagrant init myova
- vagrant up


**To DO**

- Seems that https://github.com/filetrust/k8-reverse-proxy/blob/master/upwork-devs/noureddine-yassin/reverse-proxy-icap/install.sh will not copy config files squid and nginx configuration files
- Test
- Change to newer Ubuntu (see iso definition "iso_urls" and "iso_checksum")
