/*
  If we have the choice using an implicit or explicit dependency, it's recommended to use an implicit dependency. 
*/

terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      version = "~> 3.18"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rgdep"
  location = "westeurope"
}

# Implicit dependency sample
resource "azurerm_virtual_network" "vnet-implicit-dep" {
  name                = "vnet"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name # Implicit dependency
  address_space       = ["10.0.0.0/16"]
}

# Explicit dependency sample
resource "azurerm_virtual_network" "vnet-explicit-dep" {
  name                = "vnet"
  location            = "westeurope"
  resource_group_name = "rgdep"
  address_space       = ["10.0.0.0/16"]

  depends_on = [azurerm_resource_group.rg] # Explicit dependency
}
