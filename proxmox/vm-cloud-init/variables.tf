variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "vm_tags" {
  description = "List of tags to apply to the VM"
  type        = list(string)
  default     = ["terraform"]
}

variable "vm_id" {
  description = "ID of the VM to create or clone"
  type        = number
}

variable "vm_memory" {
  description = "Memory allocated to the VM in MB"
  type        = number
  default     = 1024
}

variable "vm_cpu_cores" {
  description = "Number of CPU cores allocated to the VM"
  type        = number
  default     = 1
}

variable "vm_cpu_type" {
  description = "CPU type/model to emulate for the VM (e.g. \"host\", \"x86-64-v2-AES\", \"kvm64\")"
  type        = string
  default     = "host"
}

variable "vm_disk_size" {
  description = "Size of the boot disk in GB. null keeps the size of the template's disk. Proxmox can only grow a disk, so lowering it fails"
  type        = number
  default     = null

  validation {
    condition     = var.vm_disk_size == null || try(var.vm_disk_size > 0, false)
    error_message = "vm_disk_size must be a positive number of GB, or null."
  }
}

variable "vm_disk_interface" {
  description = "Interface of the template's boot disk, resized when vm_disk_size is set"
  type        = string
  default     = "scsi0"
}

variable "vm_disk_datastore_id" {
  description = "Datastore of the template's boot disk. Must match where the disk already is, or Proxmox moves it"
  type        = string
  default     = "local-lvm"
}

variable "vm_ipv4_address" {
  description = "IPv4 address configuration for the VM"
  type        = string
}

variable "vm_ipv4_gateway" {
  description = "IPv4 gateway for the VM"
  type        = string
}

variable "vm_username" {
  description = "Username for the VM user account"
  type        = string
}

variable "vm_description" {
  description = "Description of the VM"
  type        = string
  default     = "VM created and managed by Terraform"
}

variable "node_name" {
  description = "Proxmox node name where the VM will be created"
  type        = string
  default     = "pve"
}

variable "clone_vm_id" {
  description = "ID of the VM to clone from"
  type        = number
}

variable "dns_servers" {
  description = "List of DNS servers to use for the VM"
  type        = list(string)
}

variable "datastore_id" {
  description = "ID of the datastore where the cloud-init file will be stored"
  type        = string
  default     = "local"
}

variable "packages" {
  description = "List of packages to install on the VM"
  type        = list(string)
  default     = []
}

variable "runcmd" {
  description = "Commands to run after the VM is initialized"
  type        = list(string)
  default     = []
}

variable "ssh_authorized_keys" {
  description = "Public keys (one per line) for cloud-init"
  type        = list(string)
}

variable "timezone" {
  type    = string
  default = "America/Santiago"
}

variable "bridge" {
  type    = string
  default = "vmbr0"
}

variable "nic_model" {
  type    = string
  default = "virtio"
}

variable "qemu_agent" {
  description = "Enable QEMU Guest Agent"
  type        = bool
  default     = false
}
