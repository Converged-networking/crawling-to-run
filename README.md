# Crawling to run

Project to find out how to start slowly in the world of automation instead of trying to automate everything and setting yourself up to fail.

## Requirements

- **Containerlab**: Tool to orchestrate a docker based lab
- **Ansible**: Main pillar of automation

## The lab

![Lab topo](media/lab.drawio.png)

**Subnets:**

| Prefix       | Function                        |
| ------------ | ------------------------------- |
| 10.0.0.0/24  | P2P's leaf spine links          |
| 10.0.1.0/24  | P2P link for MLAG               |
| 10.0.2.0/24  | P2P link for routing redundancy |
| 10.0.11.0/24 | VLAN 11 to test VXLAN bridging  |
| 10.0.12.0/24 | VLAN 12 to test VXLAN bridging  |
| 10.0.13.0/24 | VLAN 13 to test VXLAN routing   |

**Leaf-Spine links:**

Spine has the lower IP of the prefix

| Leaf   | Leaf interface | Spine  | Spine interface | prefix       |
| ------ | -------------- | ------ | --------------- | ------------ |
| wan1a  | Ethernet1      | spine1 | Ethernet1       | 10.0.0.0/31  |
| wan1a  | Ethernet2      | spine2 | Ethernet1       | 10.0.0.2/31  |
| wan1b  | Ethernet1      | spine1 | Ethernet2       | 10.0.0.4/31  |
| wan1b  | Ethernet2      | spine2 | Ethernet2       | 10.0.0.6/31  |
| leaf1a | Ethernet1      | spine1 | Ethernet3       | 10.0.0.8/31  |
| leaf1a | Ethernet2      | spine2 | Ethernet3       | 10.0.0.10/31 |
| leaf1b | Ethernet1      | spine1 | Ethernet4       | 10.0.0.12/31 |
| leaf1b | Ethernet2      | spine2 | Ethernet5       | 10.0.0.14/31 |

**MLAG peer links:**

| Side A | Side B | interface 1 | interface 2 | MLAG prefix | Routed prefix |
| ------ | ------ | ----------- | ----------- | ----------- | ------------- |
| wan1a  | wan1b  | Ethernet 3  | Ethernet 4  | 10.0.1.0/31 | 10.0.2.0/31   |
| leaf1a | leaf1b | Ethernet 3  | Ethernet 4  | 10.0.1.2/31 | 10.0.2.2/31   |


To spin up a lab with EOS switches we're using Containerlab.

```bash
```