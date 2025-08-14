output "vmid" {
  description = "Container ID (VMID)."
  value       = proxmox_lxc.this.vmid
}

output "name" {
  description = "Container hostname."
  value       = proxmox_lxc.this.hostname
}

output "node" {
  description = "Target Proxmox node."
  value       = proxmox_lxc.this.target_node
}