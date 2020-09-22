# Releases


### Table of Contents
* **[Releases](#Releases)**
* **[Importing the OVA](#Importing-OVA)**
* **[Building the OVA](#Building-the-OVA)**
* **[Building the AMI](#Building-the-AMI)**
* **[Continous Integration](#Continous-Integration)**



### Releases

You can check the releases part in the repo for the release notes and the S3 link to the created OVA.

By default we have a release every week and it's automated using Github actions (refer to the CI/CD part for more info).



### Importing the OVA

- Download OVA file from: https://hcompl-my.sharepoint.com/:u:/g/personal/mariusz_ferdyn_h_com_pl/EaOCuPCAb9VGjL-Fk2KWK6sBvg1j5V0g-eiwOyNVXfisRA?e=oxl4zu
- Open VirtualBox
- Import downloaded OVA file: glasswal-proxy.ova

Expected Result: File is successfully imported

- Once OVA is imported, go to Settings>Network>Adapter 2

Expected Result: 

Attached to: Host-Only Adapter
Name: VirtualBox Host-Only Ethernet Adapter

- Start the glasswall-proxy
- Login (username: user, password: secret)
- In shell type

ip a

check the ip address for eth1 (this address is used in the following step)

- In your hosts file (on win: C:\Windows\System32\drivers\etc, on MAC/Linux: /etc/hosts) add following lines
``` bash
<IPADDRESS STEP7>  assets.publishing.service.gov.uk.glasswall-icap.com
<IPADDRESS STEP7>  gov.uk.glasswall-icap.com
<IPADDRESS STEP7>  www.gov.uk.glasswall-icap.com
```
-Open any browser and try to access: www.gov.uk.glasswall-icap.com

The page will pop up the warnings, ignore them all, and continue. 


- In case of error - Nonexisiting network choose a different network type for network adapter 1 and 2, save it and back for network adapter 1 - NAT and for network adapter 2 host only.
- In case you experience any issues, in VirtualBox cmd try running:
``` bash
sudo systemctl status docker
```
- make sure docker is running
- If there is a need to bring docker up
``` bash
cd reverse-proxy-icap-docker
docker-compose ps
```
- If squid is not started correctly
``` bash
docker-compose up -d --force-recreate squid
```
- In case there is a need to reboot:
``` bash
sudo reboot
```

### Building the OVA

 docker-compose container from https://github.com/filetrust/k8-reverse-proxy/tree/master/upwork-devs/noureddine-yassin/reverse-proxy-icap-docker

**Prepare Environment**

- Install Git for Windows (Default Settings) https://gitforwindows.org/ or a better option is to install to download and install Tortoisegit https://tortoisegit.org/download/
- Install Virtual Box (Default Settings, You can not use Hyper-V): https://download.virtualbox.org/virtualbox/6.1.14/VirtualBox-6.1.14-140239-Win.exe
	
	You can create a new Empty Virtual Machine and start it to see Bios - In this way you are sure that Hypervisor is running properly.

- Install Vagrant(Default Settings): https://releases.hashicorp.com/vagrant/2.2.10/vagrant_2.2.10_x86_64.msi
- Copy .exe from https://releases.hashicorp.com/packer/1.6.2/packer_1.6.2_windows_amd64.zip to c:\windows\system32


**Build Steps**

Clone the Repo

``` bash
git clone https://github.com/k8-proxy/s-k8-releases
```

Change directory to the cloned project

``` bash
cd s-k8-releases/
```

Clone the reverse proxy repo and tweak configuration files as described in k8-reverse-proxy/upwork-devs/noureddine-yassin/README.md.

```bash
git clone --single-branch --branch develop --recursive https://github.com/k8-proxy/k8-reverse-proxy/

```

Build the Image

``` bash
packer build box.json
```

After Successful build

Import the OVA file by going into the `output-virtualbox-iso` and Import the Image by **Double** clicking the ova file
