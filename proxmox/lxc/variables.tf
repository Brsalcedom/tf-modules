variable "vm_name" {
  description = "Name of the LXC"
  type        = string
}

variable "vm_tags" {
  description = "List of tags to apply to the LXC container"
  type        = list(string)
  default     = ["terraform", "lxc"]
}

variable "vm_id" {
  description = "ID of the LXC to create or clone"
  type        = number
}

variable "vm_memory" {
  description = "Memory allocated to the LXC in MB"
  type        = number
  default     = 1024
}

variable "vm_cpu_cores" {
  description = "Number of CPU cores allocated to the LXC"
  type        = number
  default     = 1
}

variable "vm_ipv4_address" {
  description = "IPv4 address configuration for the LXC"
  type        = string
}

variable "vm_ipv4_gateway" {
  description = "IPv4 gateway for the LXC"
  type        = string
}

variable "vm_description" {
  description = "Description of the LXC"
  type        = string
  default     = "LXC created and managed by Terraform"
}

variable "node_name" {
  description = "Proxmox node name where the LXC will be created"
  type        = string
  default     = "pve"
}

variable "dns_servers" {
  description = "DNS server to use for the LXC container"
  type        = list(string)
}

variable "os_template" {
  description = "OS template to use for the LXC container"
  type        = string
}

variable "vm_disk_size" {
  description = "Disk size for the LXC in GB"
  type        = number
  default     = 4
}

variable "bridge" {
  type    = string
  default = "vmbr0"
}

variable "nic_name" {
  type    = string
  default = "eth0"
}

variable "ssh_authorized_keys" {
  description = "Public keys"
  type        = list(string)
}

variable "unprivileged" {
  description = "Manage unprivileged container"
  type        = bool
  default     = true
}