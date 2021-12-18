#!/bin/bash

ip link add bond0 type bond
ip link set bond0 type bond mode 802.3ad
ip link set eth1 down
ip link set eth1 master bond0
ip link set eth2 down
ip link set eth2 master bond0
ip link set dev bond0 type bond xmit_hash_policy layer3+4
ip link set dev bond0 type bond lacp_rate fast
ip link set bond0 up

ip address add 10.0.12.5/24 dev bond0
ip route change default via 10.0.12.1