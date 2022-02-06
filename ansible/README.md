# Network automation

All over documentation of network automation.

## Requirements

- docker
- arista.avd
- python
- batfish
- ansible

## Roles

- [batfish:](roles/collect_facts/README.md)
- [gen_dc_eos_config:](roles/gen_dc_eos_config/README.md)
- [net_deploy:](roles/net_deploy/README.md)

## Run

```bash
ansible-playbook playbooks/build.yml
ansible-playbook -e '@creds-lab.yml' playbooks/diff.yml
```

## Batfish

```bash
docker pull batfish/allinone

ansible-playbook -e '@creds-lab.yml' playbooks/pre.yml
```
