### RELEASE 1 OVA

Release 1 includes the completed/tested pieces of the Reverse Proxy project as a "reverse-proxy-icap-docker" to run inside a standard Ubuntu 18.04 server OVA image. The completed pieces of this project so far are:

- Squid based reverse Proxy for a specific website.
- Two Way URL rewrite/ with the help of NGINX in front of Squid.
- SSL termination.
- ICAP integration

**Credits**

OVA Packer scripts by NourEddineX
reverse-proxy-icap-docker by NourEddineX and yassin


### USING RELEASE 1 OVA - FastTrack 

- Download OVA file from: https://hcompl-my.sharepoint.com/:u:/g/personal/mariusz_ferdyn_h_com_pl/EaOCuPCAb9VGjL-Fk2KWK6sBvg1j5V0g-eiwOyNVXfisRA?e=I0x0a9
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
	<IPADDRESS STEP7>  assets.publishing.service.gov.uk.glasswall-icap.com
	<IPADDRESS STEP7>  gov.uk.glasswall-icap.com
	<IPADDRESS STEP7>  www.gov.uk.glasswall-icap.com 
-Open any browser and try to access: www.gov.uk.glasswall-icap.com
	The page will pop up the warnings, ignore them all, and continue. 


- In case of error - Nonexisiting network choose a different network type for network adapter 1 and 2, save it and back for network adapter 1 - NAT and for network adapter 2 host only.
- In case you experience any issues, in VirtualBox cmd try running:
- sudo systemctl status docker
- make sure docker is running
- If there is a need to bring docker up
	cd reverse-proxy-icap-docker
	docker-compose ps
- If squid is not started correctly
	docker-compose up -d --force-recreate squid
- In case there is a need to reboot:
	sudo reboot



### Create OVA with docker-compose container from https://github.com/filetrust/k8-reverse-proxy/tree/master/upwork-devs/noureddine-yassin/reverse-proxy-icap-docker

**Prepare Environment**

- Install Git for Windows (Default Settings) https://gitforwindows.org/ or a better option is to install to download and install Tortoisegit https://tortoisegit.org/download/
- Install Virtual Box (Default Settings, You can not use Hyper-V): https://download.virtualbox.org/virtualbox/6.1.14/VirtualBox-6.1.14-140239-Win.exe
	You can create a new Empty Virtual Machine and start it to see Bios - In this way you are sure that Hypervisor is running properly.
- Install Vagrant(Default Settings): https://releases.hashicorp.com/vagrant/2.2.10/vagrant_2.2.10_x86_64.msi
- Copy .exe from https://releases.hashicorp.com/packer/1.6.2/packer_1.6.2_windows_amd64.zip to c:\windows\system32


**Build Steps**

Clone the Repo

``` bash
git clone https://github.com/filetrust/k8-ova.git
```

Go to the `packer` Directory

``` bash
cd k8-ova/packer
```

Clone the reverse proxy repo and tweak configuration files as described in k8-reverse-proxy/upwork-devs/noureddine-yassin/README.md - especially set correct ICAP server.

```bash
git clone https://github.com/filetrust/k8-reverse-proxy
```

make an archive from reverse-proxy-icap-docker folder

```bash
del revproxy.tar.gz
tar czvf revproxy.tar.gz -C k8-reverse-proxy/upwork-devs/noureddine-yassin/ reverse-proxy-icap-docker/
```

The previous command doesn't work under Windows, so in this repo version, https://github.com/filetrust/k8-reverse-proxy/tree/cad5824e6a0e85cd6ebfbfedd79080eeb1af524d is included - revproxy.tar.gz (ICAP_URL=icap://20.54.208.58:1344/gw_rebuild).

Build the Image

``` bash
packer build box.json
```

After Successful build

Import the OVA file by going into the `output-virtualbox-iso` and Import the Image by **Double** clicking the ova file
