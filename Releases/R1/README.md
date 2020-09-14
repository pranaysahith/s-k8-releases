### RELEASE 0.1 OVA

Release 0.1 includes the completed/tested pieces of the Reverse Proxy project as a "docker-compose script" to run inside an standard Ubuntu 18.04 server OVA image. The completed pieces of this project so far are:

- Squid based reverse Proxy for a specific website.
- Two Way URL rewrite/ with the help of NGINX in front of Squid.
- SSL termination.
- ICAP integration (icap://gw-icap01.westeurope.azurecontainer.io/gw_rebuild)

## Instructions:
- Download the OVA http://51.11.8.179:1234/glasswall-proxy.ova
- Import it to VirtualBox , open settings, choose the network for network adapter 2
- system credentials:
username: user
password: secret
- check the ip address of eth1, add it your hosts files as follows

  `1.2.3.4 assets.publishing.service.gov.uk.glasswall-icap.com`

  `1.2.3.4 gov.uk.glasswall-icap.com`

  `1.2.3.4 www.gov.uk.glasswall-icap.com `
