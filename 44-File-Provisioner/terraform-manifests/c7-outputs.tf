# 1. Output Values - Resource Group
output "resource_group_id" {
  description = "Resource Group ID"
  # Atrribute Reference
  value = azurerm_resource_group.myRg.id
}
output "resource_group_name" {
  description = "Resource Group name"
  # Argument Reference0
  value = azurerm_resource_group.myRg.name
}

# 2. Output Values - Virtual Network
output "virtual_network_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.myVnet.name
  #sensitive = true
}

# 3. Output Values - Virtual Machine
output "vm_public_ip_address" {
  description = "My Virtual Machine Public IP"
  value       = azurerm_linux_virtual_machine.myLinuxVm.public_ip_address
}

# 4. Output Values - Virtual Machine Admin User
output "vm_admin_user" {
  description = "My Virtual Machine Admin User"
  value       = azurerm_linux_virtual_machine.myLinuxVm.admin_username
}
