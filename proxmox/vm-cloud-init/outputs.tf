output "node" {
  description = "Node where the VM is running."
  value       = proxmox_virtual_environment_vm.this.node_name
}

output "vm_name" {
  description = "Name of the VM."
  value       = proxmox_virtual_environment_vm.this.name
}

output "vm_username" {
  value = var.vm_username
}

output "vm_ipv4_address" {
  value = var.vm_ipv4_address
}