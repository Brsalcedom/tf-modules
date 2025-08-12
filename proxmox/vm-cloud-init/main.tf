locals {
  cloud_config = {
    hostname       = var.vm_name
    timezone       = var.timezone
    package_update = true
    packages       = var.packages
    users = [
      {
        name                = var.vm_username
        groups              = ["sudo"]
        shell               = "/bin/bash"
        sudo                = "ALL=(ALL) NOPASSWD:ALL"
        ssh_authorized_keys = var.ssh_authorized_keys
      }
    ]
    runcmd = var.runcmd
  }
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
  description = var.vm_description
  tags        = var.vm_tags
  node_name   = var.node_name
  vm_id       = var.vm_id

  clone {
    vm_id = var.clone_vm_id
  }

  agent {
    enabled = false
  }

  operating_system {
    type = "l26"
  }

  cpu {
    cores = var.vm_cpu_cores
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = var.vm_memory
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
    proxmox_virtual_environment_file.cloud_config,
    tls_private_key.private_key
  ]
}
