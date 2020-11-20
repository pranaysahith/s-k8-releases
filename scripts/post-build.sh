#!/bin/bash
rm -f /etc/netplan/*.yml /etc/netplan/*.yaml
cat > /etc/netplan/network.yaml <<EOF
network:
  version: 2
  ethernets:
    eth0:
      addresses:
        - $( ip addr show $(ip route |grep default |head -n1|grep -o -P '(?<=dev )[a-z0-9]{2,20}') | grep -o -P '(?<=inet )[0-9./]{9,18}' )
      gateway4: $( ip route |grep default |head -n1|grep -o -P '(?<=via )[0-9.]{7,15}' )
      dhcp4: false
      nameservers:
        addresses: [8.8.8.8]
    eth1:
      addresses: [$1]
      dhcp4: false
EOF
netplan generate && netplan --debug apply