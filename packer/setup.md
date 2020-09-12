## Creating Ova Files using the Packer

Download and Install the **Packer** tool using the given [link](https://www.packer.io/downloads)

Download and Install **Virtualbox** using the given [link](https://www.virtualbox.org/manual/ch02.html)

## Installation Steps

Clone the Repo

``` bash
git clone https://github.com/filetrust/k8-ova.git
```

Move into the `packer` Directory

``` bash
cd k8-ova/packer
```

Clone the reverse proxy repo and tweak configuration files as described in k8-reverse-proxy/upwork-devs/noureddine-yassin/README.md

```bash
git clone https://github.com/filetrust/k8-reverse-proxy
```

make and archive from reverse-proxy-icap-docker folder

```bash
tar czvf revproxy.tar.gz -C k8-reverse-proxy/upwork-devs/noureddine-yassin/ reverse-proxy-icap-docker/
```

Build the Image

``` bash
packer build box.json
```

After Sucessfull Installation

Import the OVA file by going into the `output-virtualbox-iso` and Import the Image by **Double** clicking the ova file 

```
username:user
password:secret
```

### Tools Installed

- Git
- Docker
- docker-compose

### Todo

- Clonning the Repo
- Installing the Script

