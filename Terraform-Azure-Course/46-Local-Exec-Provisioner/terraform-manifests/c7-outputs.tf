output "resource_group_id" {
  description = "Resource Group ID"
  value       = azurerm_resource_group.myRg.id
}

output "resource_group_name" {
  description = "Resource Group name"
  value       = azurerm_resource_group.myRg.name
}

output "virtual_network_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.myVnet.name
  #sensitive = true
}

output "vm_public_ip_address" {
  description = "My Virtual Machine Public IP"
  value       = azurerm_linux_virtual_machine.myLinuxVm.public_ip_address
}

output "vm_admin_user" {
  description = "My Virtual Machine Admin User"
  value       = azurerm_linux_virtual_machine.myLinuxVm.admin_username
}
