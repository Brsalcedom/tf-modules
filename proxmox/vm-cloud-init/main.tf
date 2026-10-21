locals {
  cloud_config = merge(
    {
      hostname       = var.vm_name
      fqdn           = var.vm_name
      timezone       = var.timezone
      package_update = true
      users = [
        {
          name                = var.vm_username
          groups              = ["sudo"]
          shell               = "/bin/bash"
          sudo                = "ALL=(ALL) NOPASSWD:ALL"
          ssh_authorized_keys = var.ssh_authorized_keys
        }
      ]
    },
    length(var.packages) > 0 ? { packages = var.packages } : {},
    length(var.runcmd) > 0 ? { runcmd = var.runcmd } : {}
  )
}

resource "proxmox_virtual_environment_file" "cloud_config" {
  content_type = "snippets"
  datastore_id = var.datastore_id
  node_name    = var.node_name
  source_raw {
    data      = <<EOF
#cloud-config
${yamlencode(local.cloud_config)}
EOF
    file_name = "${var.vm_name}.yaml"
  }
}


resource "proxmox_virtual_environment_vm" "this" {
  name        = var.vm_name
  description = trimspace(var.vm_description)
  tags        = var.vm_tags
  node_name   = var.node_name
  vm_id       = var.vm_id

  clone {
    vm_id = var.clone_vm_id
  }

  agent {
    enabled = var.qemu_agent
  }

  operating_system {
    type = "l26"
  }

  cpu {
    cores = var.vm_cpu_cores
    type  = var.vm_cpu_type
  }

  memory {
    dedicated = var.vm_memory
  }

  # Without vm_disk_size the clone keeps the template's disk untouched. With it,
  # the disk on vm_disk_interface is resized; Proxmox can only grow a disk.
  dynamic "disk" {
    for_each = var.vm_disk_size == null ? [] : [var.vm_disk_size]
    content {
      interface    = var.vm_disk_interface
      datastore_id = var.vm_disk_datastore_id
      size         = disk.value
      # Applied to the existing disk too: the provider sets every option of the
      # block, so this has to match the template's disk.
      iothread = var.vm_disk_iothread
    }
  }

  initialization {
    dns {
      servers = var.dns_servers
    }
    ip_config {
      ipv4 {
        address = var.vm_ipv4_address
        gateway = var.vm_ipv4_gateway
      }
    }

    user_account {
      username = var.vm_username
    }

    user_data_file_id = proxmox_virtual_environment_file.cloud_config.id
  }

  network_device {
    bridge = var.bridge
    model  = var.nic_model
  }

  depends_on = [
    proxmox_virtual_environment_file.cloud_config
  ]
}
