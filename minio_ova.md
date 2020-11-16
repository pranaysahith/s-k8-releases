## Setup Minio server using virtualbox and OVA

Download the OVA from here - s3://glasswall-sow-ova/vms/Minio-Server/minio_server.ova

After importing the OVA to virtualbox, make sure network adaptor 1 has "NAT" and adaptor 2 has "VirtualBox Host-Only Ethernet Adaptor"

Once the VM is started, open the IP address of the VM in browser and it should open minio server.

credentials are -

username: user

password: secret_password

Update the /etc/hosts file with the IP address and a DNS name

Example:

    ```
    192.168.56.102 minio.server
    ```

Once the hosts file is updated, minio can be accessed at http://minio.server from browser.

## Setup proxy for minio server

Download the OVA from here - s3://glasswall-sow-ova/vms/Minio-Server/minio_proxy.ova

After importing the OVA to virtualbox, make sure network adaptor 1 has "NAT" and adaptor 2 has "VirtualBox Host-Only Ethernet Adaptor"

Once the VM is started, update the /etc/hosts file inside the VM with IP address of above server and DNS name as `minio.server`

Example:

    ```
    192.168.56.102 minio.server
    ```

In the host machine update the /etc/hosts file with IP address of this server and DNS name as `minio.server.glasswall-icap.com`

Example:

```
192.168.56.103 minio.server.glasswall-icap.com
```

Proxied minio server can be now accessed at http://minio.server.glasswall-icap.com

Note: Make sure the IP addresses of above 2 servers are not same. If the IP address is same, run below commands on a VM to get a new IP address.

```
sudo ip addr flush all
sudo dhclient
```
