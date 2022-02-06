# Ansible network automation

This is a network automation project primarily using Ansible but also using batfish to do pre-checks and Robot framework to do post checks.

`setup.sh` performs a workflow that does the following:

- Build configuration for network
- Perform pre-checks on configs using batfish
- Diff configuration against the live network
- Backup configuration off the live network
- Deploy configuration on the live network
- Rollback if any deployment fails
- Perform post-checks using robot
- Rollback if post-checks fail

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

## Quickrun

```bash
./pipeline.sh
```
