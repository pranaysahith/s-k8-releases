### Create OVA from https://github.com/filetrust/k8-reverse-proxy/tree/master/upwork-devs/noureddine-yassin/reverse-proxy-icap

**Prepare Environment**

- Install Git for Windows (Default Settings) https://gitforwindows.org/ - I propose to download and install Tortoisegit https://tortoisegit.org/download/
- Install Virtual Box (Default Settings, You can not use Hyper-V): https://download.virtualbox.org/virtualbox/6.1.14/VirtualBox-6.1.14-140239-Win.exe
  You can create a new Empty Virtual Machine and start it to see Bios - In this way you are sure that Hypervisor is running properly.
- Install Vagrant(Default Settings): https://releases.hashicorp.com/vagrant/2.2.10/vagrant_2.2.10_x86_64.msi
- Copy packer.exe from https://releases.hashicorp.com/packer/1.6.2/packer_1.6.2_windows_amd64.zip to c:\windows\system32

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
