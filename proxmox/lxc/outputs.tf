output "vmid" {
  description = "Container ID (VMID)."
  value       = proxmox_virtual_environment_container.this.vm_id
}

output "name" {
  description = "Container hostname."
  value       = proxmox_virtual_environment_container.this.initialization[0].hostname
}

output "node" {
  description = "Target Proxmox node."
  value       = proxmox_virtual_environment_container.this.node_name
}