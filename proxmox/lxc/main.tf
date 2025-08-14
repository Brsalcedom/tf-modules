resource "proxmox_lxc" "this" {
  hostname    = var.vm_name
  description = var.vm_description
  vmid        = var.vm_id
  target_node = var.node_name
  tags        = length(var.vm_tags) > 0 ? join(";", var.vm_tags) : null
  ostemplate  = "local:vztmpl/${var.os_template}"
  cores       = var.vm_cpu_cores
  memory      = var.vm_memory
  swap        = var.vm_memory
  rootfs {
    storage = "local-lvm"
    size    = "${var.vm_disk_size}G"
  }
  nameserver = var.dns_server
  network {
    name   = var.nic_name
    bridge = var.bridge
    ip     = var.vm_ipv4_address
    gw     = var.vm_ipv4_gateway
  }
  features {
    nesting = true
  }
  unprivileged    = true
  ssh_public_keys = var.ssh_authorized_key
  onboot          = true
}
