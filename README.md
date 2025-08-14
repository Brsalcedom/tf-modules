# Terraform Modules for Proxmox

This repository contains Terraform modules for provisioning resources on Proxmox.

## Available Modules

### Proxmox LXC Container

This module provisions an **LXC container** on Proxmox. It supports unprivileged containers, optional nesting, extra mounts, and cloud-init–style SSH public keys.

#### Basic Usage
```hcl
module "proxmox_lxc" {
  source             = "git::https://github.com/Brsalcedom/tf-modules//proxmox/lxc?ref=v0.1.0"
  vm_name            = "swarm-01"
  vm_id              = 101
  os_template        = "debian-12-standard_12.2-1_amd64.tar.zst"
  vm_cpu_cores       = 2
  vm_memory          = 2048
  vm_disk_size       = 15
  vm_ipv4_address    = "192.168.1.50/24"
  vm_ipv4_gateway    = "192.168.1.1"
  dns_server         = "1.1.1.1"
  ssh_authorized_key = file("~/.ssh/id_rsa.pub")
  vm_description     = "Docker Swarm node"
  vm_tags            = "terraform;lxc"
}
```

For more details, see the [LXC module README](./proxmox/lxc/README.md).

### Proxmox VM (Cloud-Init)

This module provisions a **Proxmox VM** by cloning a cloud-init–enabled template and attaching a `user-data` file uploaded to the Proxmox snippets datastore.

#### Basic Usage

```hcl
module "proxmox_vm" {
  source                = "git::https://github.com/Brsalcedom/tf-modules//proxmox/vm-cloud-init?ref=v0.1.0"
  vm_name               = "k3s-hyperion"
  vm_id                 = 110
  vm_memory             = 2048
  vm_cpu_cores          = 2
  clone_vm_id           = 9000
  vm_username           = "rocky"
  vm_ipv4_address       = "192.168.1.40/24"
  vm_ipv4_gateway       = "192.168.1.1"
  dns_servers           = ["1.1.1.1", "8.8.8.8"]
  vm_tags               = ["k3s", "hyperion"]
  ssh_authorized_keys   = file("id_rsa.pub")
}
```

For more details, see the [VM (Cloud-Init) module README](./proxmox/vm-cloud-init/README.md).
