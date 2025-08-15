# Proxmox LXC Container

This Terraform module provisions an **LXC container** on Proxmox. It supports unprivileged containers, optional nesting and cloud-init–style SSH public keys.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement_proxmox) | >= 0.80.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider_proxmox) | >= 0.80.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_container.this](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_servers"></a> [dns_servers](#input_dns_servers) | DNS server to use for the LXC container | `list(string)` | n/a | yes |
| <a name="input_os_template"></a> [os_template](#input_os_template) | OS template to use for the LXC container | `string` | n/a | yes |
| <a name="input_ssh_authorized_keys"></a> [ssh_authorized_keys](#input_ssh_authorized_keys) | Public keys | `list(string)` | n/a | yes |
| <a name="input_vm_id"></a> [vm_id](#input_vm_id) | ID of the LXC to create or clone | `number` | n/a | yes |
| <a name="input_vm_ipv4_address"></a> [vm_ipv4_address](#input_vm_ipv4_address) | IPv4 address configuration for the LXC | `string` | n/a | yes |
| <a name="input_vm_ipv4_gateway"></a> [vm_ipv4_gateway](#input_vm_ipv4_gateway) | IPv4 gateway for the LXC | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm_name](#input_vm_name) | Name of the LXC | `string` | n/a | yes |
| <a name="input_bridge"></a> [bridge](#input_bridge) | n/a | `string` | `"vmbr0"` | no |
| <a name="input_nic_name"></a> [nic_name](#input_nic_name) | n/a | `string` | `"eth0"` | no |
| <a name="input_node_name"></a> [node_name](#input_node_name) | Proxmox node name where the LXC will be created | `string` | `"pve"` | no |
| <a name="input_vm_cpu_cores"></a> [vm_cpu_cores](#input_vm_cpu_cores) | Number of CPU cores allocated to the LXC | `number` | `1` | no |
| <a name="input_vm_description"></a> [vm_description](#input_vm_description) | Description of the LXC | `string` | `"LXC created and managed by Terraform"` | no |
| <a name="input_vm_disk_size"></a> [vm_disk_size](#input_vm_disk_size) | Disk size for the LXC in GB | `number` | `4` | no |
| <a name="input_vm_memory"></a> [vm_memory](#input_vm_memory) | Memory allocated to the LXC in MB | `number` | `1024` | no |
| <a name="input_vm_tags"></a> [vm_tags](#input_vm_tags) | List of tags to apply to the LXC container | `list(string)` | <pre>[<br/>  "terraform",<br/>  "lxc"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output_name) | Container hostname. |
| <a name="output_node"></a> [node](#output_node) | Target Proxmox node. |
| <a name="output_vmid"></a> [vmid](#output_vmid) | Container ID (VMID). |
<!-- END_TF_DOCS -->
