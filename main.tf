data "azurerm_client_config" "current" {}

provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# Virtual Network
# resource "azurerm_virtual_network" "vnet" {
#   name                = var.vnet_name
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }

# # Subnet
# resource "azurerm_subnet" "demo-subnet" {
#   name                 = var.subnet_name
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.0.0/24"]
# }

# # Network Security Group
# resource "azurerm_network_security_group" "demo-nsg" {
#   name                = var.nsg_name
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   security_rule {
#     name                       = "AllowSSH"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "22"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# # NSG Association
# resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
#   subnet_id                 = azurerm_subnet.demo-subnet.id
#   network_security_group_id = azurerm_network_security_group.demo-nsg.id

#   depends_on = [
#     azurerm_subnet.demo-subnet,
#     azurerm_network_security_group.demo-nsg
#   ]
# }

# # Public IP
# resource "azurerm_public_ip" "demo_public_ip" {
#   name                = "demo-public-ip"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

# # Network Interface
# resource "azurerm_network_interface" "demo_nic" {
#   name                = "demo-nic"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   depends_on = [
#     azurerm_subnet.demo-subnet
#   ]

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = azurerm_subnet.demo-subnet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = azurerm_public_ip.demo_public_ip.id
#   }
# }

# # Linux Virtual Machine
# resource "azurerm_linux_virtual_machine" "demo_vm" {
#   name                            = var.vm_name
#   resource_group_name             = azurerm_resource_group.rg.name
#   location                        = azurerm_resource_group.rg.location
#   size                            = var.vm_size
#   admin_username                  = var.admin_username
#   admin_password                  = var.admin_password
#   disable_password_authentication = false

#   network_interface_ids = [
#     azurerm_network_interface.demo_nic.id
#   ]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }

# # Key Vault
# resource "azurerm_key_vault" "demo_kv" {
#   name                = var.key_vault_name
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   tenant_id           = data.azurerm_client_config.current.tenant_id
#   sku_name            = "standard"

#   soft_delete_retention_days = 7
#   purge_protection_enabled   = false

#   access_policy {
#     tenant_id = data.azurerm_client_config.current.tenant_id
#     object_id = data.azurerm_client_config.current.object_id

#     secret_permissions = [
#       "Get",
#       "List",
#       "Set",
#       "Delete"
#     ]
#   }
# }

# # store VM password in Key Vault
# resource "azurerm_key_vault_secret" "vm_password" {
#   name         = "vm-admin-password"
#   value        = var.admin_password
#   key_vault_id = azurerm_key_vault.demo_kv.id
# }
