# Network automation

All over documentation of network automation.

## Requirements

- Stub

## Roles

- [collect_facts:](roles/collect_facts/README.md) Collect config to use as a base in following roles

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
