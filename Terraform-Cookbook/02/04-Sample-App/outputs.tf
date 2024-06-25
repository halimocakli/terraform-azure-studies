output "webapp_hostname" {
  description = "Hostname of the webapp"
  value       = azurerm_linux_web_app.app.default_hostname
}

output "webapp_name" {
  description = "Name of the webapp"
  value       = azurerm_linux_web_app.app.name
}

output "webapp_password" {
  description = "Credential of the webapp"
  value       = azurerm_linux_web_app.app.site_credential
  sensitive   = true
}
