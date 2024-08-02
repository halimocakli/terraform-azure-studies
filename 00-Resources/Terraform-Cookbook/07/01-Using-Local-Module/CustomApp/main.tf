terraform {
  required_version = "~> 1.1"
  required_providers {
    azurerm = {
      version = "~> 3.23"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-app" {
  name     = "RG_CustomApp_Demo"
  location = "West Europe"
}

module "webapp" {
  source                = "../WebAppModule"
  service_plan_name     = "spmyapp"
  app_name              = "halimsappdemo"
  location              = azurerm_resource_group.rg-app.location
  resource_group_name   = azurerm_resource_group.rg-app.name
  operating_system_type = "Linux"
}

output "webapp_url" {
  value = module.webapp.webapp_url
}

output "webapp_id" {
  value = module.webapp.webapp_id
}
