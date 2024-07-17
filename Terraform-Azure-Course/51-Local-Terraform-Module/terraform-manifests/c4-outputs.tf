# Output variable definitions
output "resource_group_id" {
  description = "resource group id"
  value       = module.azure_static_website.resource_group_id
}
output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.azure_static_website.resource_group_name
}
output "resource_group_location" {
  description = "resource group location"
  value       = module.azure_static_website.resource_group_location
}
output "storage_account_id" {
  description = "storage account id"
  value       = module.azure_static_website.storage_account_id
}
output "storage_account_name" {
  description = "storage account name"
  value       = module.azure_static_website.storage_account_name
}
output "primary_web_host" {
  description = "web host for html files"
  value       = module.azure_static_website.primary_web_host
}
