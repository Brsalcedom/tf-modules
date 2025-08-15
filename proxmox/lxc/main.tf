resource "proxmox_virtual_environment_container" "this" {
  node_name   = var.node_name
  vm_id       = var.vm_id
  description = trimspace(var.vm_description)

  tags = length(var.vm_tags) > 0 ? sort(var.vm_tags) : null

  memory {
    dedicated = var.vm_memory
    swap      = var.vm_memory
  }

  cpu {
    cores = var.vm_cpu_cores
  }

  disk {
    datastore_id = "local-lvm"
    size         = var.vm_disk_size
  }

  operating_system {
    template_file_id = "local:vztmpl/${var.os_template}"
    type             = "debian"
  }

  network_interface {
    name   = var.nic_name
    bridge = var.bridge
  }

  initialization {
    hostname = var.vm_name

    ip_config {
      ipv4 {
        address = var.vm_ipv4_address
        gateway = var.vm_ipv4_gateway
      }
    }

    user_account {
      keys = var.ssh_authorized_keys
    }

    dns {
      servers = var.dns_servers
    }
  }

  features {
    nesting = true
  }

  unprivileged  = true
  start_on_boot = true
  started       = true
}