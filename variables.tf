variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "demo-rg"
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US 2"
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "demo-vnet"
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
  default     = "demo-subnet"
}

variable "nsg_name" {
  description = "NSG Name"
  type        = string
  default     = "demo-nsg"
}

variable "vm_name" {
  description = "VM Name"
  type        = string
  default     = "demo-vm"
}

variable "vm_size" {
  description = "VM Size"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "VM Username"
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "VM Password"
  type        = string
  sensitive   = true
}

variable "key_vault_name" {
  type = string
}