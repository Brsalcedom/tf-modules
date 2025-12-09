# Proxmox LXC Container

This Terraform module provisions an **LXC container** on Proxmox. It supports unprivileged containers, optional nesting and cloud-init–style SSH public keys.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | >= 0.80.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | >= 0.80.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_container.this](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bridge"></a> [bridge](#input\_bridge) | n/a | `string` | `"vmbr0"` | no |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | DNS server to use for the LXC container | `list(string)` | n/a | yes |
| <a name="input_nas_mountpoint"></a> [nas\_mountpoint](#input\_nas\_mountpoint) | Mountpoint for the NAS (must be overridden) | `string` | `null` | no |
| <a name="input_nic_name"></a> [nic\_name](#input\_nic\_name) | n/a | `string` | `"eth0"` | no |
| <a name="input_node_name"></a> [node\_name](#input\_node\_name) | Proxmox node name where the LXC will be created | `string` | `"pve"` | no |
| <a name="input_os_template"></a> [os\_template](#input\_os\_template) | OS template to use for the LXC container | `string` | n/a | yes |
| <a name="input_ssh_authorized_keys"></a> [ssh\_authorized\_keys](#input\_ssh\_authorized\_keys) | Public keys | `list(string)` | n/a | yes |
| <a name="input_unprivileged"></a> [unprivileged](#input\_unprivileged) | Manage unprivileged container | `bool` | `true` | no |
| <a name="input_vm_cpu_cores"></a> [vm\_cpu\_cores](#input\_vm\_cpu\_cores) | Number of CPU cores allocated to the LXC | `number` | `1` | no |
| <a name="input_vm_description"></a> [vm\_description](#input\_vm\_description) | Description of the LXC | `string` | `"LXC created and managed by Terraform"` | no |
| <a name="input_vm_disk_size"></a> [vm\_disk\_size](#input\_vm\_disk\_size) | Disk size for the LXC in GB | `number` | `4` | no |
| <a name="input_vm_id"></a> [vm\_id](#input\_vm\_id) | ID of the LXC to create or clone | `number` | n/a | yes |
| <a name="input_vm_ipv4_address"></a> [vm\_ipv4\_address](#input\_vm\_ipv4\_address) | IPv4 address configuration for the LXC | `string` | n/a | yes |
| <a name="input_vm_ipv4_gateway"></a> [vm\_ipv4\_gateway](#input\_vm\_ipv4\_gateway) | IPv4 gateway for the LXC | `string` | n/a | yes |
| <a name="input_vm_memory"></a> [vm\_memory](#input\_vm\_memory) | Memory allocated to the LXC in MB | `number` | `1024` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of the LXC | `string` | n/a | yes |
| <a name="input_vm_tags"></a> [vm\_tags](#input\_vm\_tags) | List of tags to apply to the LXC container | `list(string)` | <pre>[<br/>  "terraform",<br/>  "lxc"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Container hostname. |
| <a name="output_node"></a> [node](#output\_node) | Target Proxmox node. |
| <a name="output_vmid"></a> [vmid](#output\_vmid) | Container ID (VMID). |
<!-- END_TF_DOCS -->
