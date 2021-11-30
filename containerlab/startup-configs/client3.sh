#!/bin/bash

cat > /etc/network/interfaces << EOF
auto eth1
iface eth1 inet static
  address 10.0.13.5
  netmask 255.255.255.0
  gateway 10.0.13.1
EOF

ifup eth1
ip route change default via 10.0.13.1