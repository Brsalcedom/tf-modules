# Proxmox VM (Cloud‑Init)

This Terraform module provisions a **Proxmox VM** by cloning a cloud‑init–enabled template and attaching a `user-data` file uploaded to the Proxmox snippets datastore.

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
| [proxmox_virtual_environment_file.cloud_config](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_file) | resource |
| [proxmox_virtual_environment_vm.this](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_vm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_clone_vm_id"></a> [clone_vm_id](#input_clone_vm_id) | ID of the VM to clone from | `number` | n/a | yes |
| <a name="input_dns_servers"></a> [dns_servers](#input_dns_servers) | List of DNS servers to use for the VM | `list(string)` | n/a | yes |
| <a name="input_ssh_authorized_keys"></a> [ssh_authorized_keys](#input_ssh_authorized_keys) | Public keys (one per line) for cloud-init | `list(string)` | n/a | yes |
| <a name="input_vm_id"></a> [vm_id](#input_vm_id) | ID of the VM to create or clone | `number` | n/a | yes |
| <a name="input_vm_ipv4_address"></a> [vm_ipv4_address](#input_vm_ipv4_address) | IPv4 address configuration for the VM | `string` | n/a | yes |
| <a name="input_vm_ipv4_gateway"></a> [vm_ipv4_gateway](#input_vm_ipv4_gateway) | IPv4 gateway for the VM | `string` | n/a | yes |
| <a name="input_vm_name"></a> [vm_name](#input_vm_name) | Name of the VM | `string` | n/a | yes |
| <a name="input_vm_username"></a> [vm_username](#input_vm_username) | Username for the VM user account | `string` | n/a | yes |
| <a name="input_bridge"></a> [bridge](#input_bridge) | n/a | `string` | `"vmbr0"` | no |
| <a name="input_datastore_id"></a> [datastore_id](#input_datastore_id) | ID of the datastore where the cloud-init file will be stored | `string` | `"local"` | no |
| <a name="input_nic_model"></a> [nic_model](#input_nic_model) | n/a | `string` | `"virtio"` | no |
| <a name="input_node_name"></a> [node_name](#input_node_name) | Proxmox node name where the VM will be created | `string` | `"pve"` | no |
| <a name="input_packages"></a> [packages](#input_packages) | List of packages to install on the VM | `list(string)` | `[]` | no |
| <a name="input_qemu_agent"></a> [qemu_agent](#input_qemu_agent) | Enable QEMU Guest Agent | `bool` | `false` | no |
| <a name="input_runcmd"></a> [runcmd](#input_runcmd) | Commands to run after the VM is initialized | `list(string)` | `[]` | no |
| <a name="input_timezone"></a> [timezone](#input_timezone) | n/a | `string` | `"America/Santiago"` | no |
| <a name="input_vm_cpu_cores"></a> [vm_cpu_cores](#input_vm_cpu_cores) | Number of CPU cores allocated to the VM | `number` | `1` | no |
| <a name="input_vm_description"></a> [vm_description](#input_vm_description) | Description of the VM | `string` | `"VM created and managed by Terraform"` | no |
| <a name="input_vm_memory"></a> [vm_memory](#input_vm_memory) | Memory allocated to the VM in MB | `number` | `1024` | no |
| <a name="input_vm_tags"></a> [vm_tags](#input_vm_tags) | List of tags to apply to the VM | `list(string)` | <pre>[<br/>  "terraform"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_node"></a> [node](#output_node) | Node where the VM is running. |
| <a name="output_vm_ipv4_address"></a> [vm_ipv4_address](#output_vm_ipv4_address) | n/a |
| <a name="output_vm_name"></a> [vm_name](#output_vm_name) | Name of the VM. |
| <a name="output_vm_username"></a> [vm_username](#output_vm_username) | n/a |
<!-- END_TF_DOCS -->