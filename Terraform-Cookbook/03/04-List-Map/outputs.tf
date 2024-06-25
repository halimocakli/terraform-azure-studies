/*

  value = [for app in azurerm_linux_web_app.app : app.name] ifadesinin sonucu aşağıdaki gibidir:

  app_service_names = [
    "halimswebapp1",
    "halimswebapp2",
  ]

*/
output "app_service_names" {
  value = [for app in azurerm_linux_web_app.app : app.name]
}

/*

  { for app in azurerm_linux_web_app.app : app.name => app.default_hostname } ifadesinin sonucu aşağıdaki gibidir:

  app_service_urls = {
    "halimswebapp1" = "halimswebapp1.azurewebsites.net"
    "halimswebapp2" = "halimswebapp2.azurewebsites.net"
  }

*/
output "app_service_urls" {
  value = { for app in azurerm_linux_web_app.app : app.name => app.default_hostname }
}
