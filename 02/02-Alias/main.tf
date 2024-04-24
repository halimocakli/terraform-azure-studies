terraform {
  required_version = "~> 1.1"
  required_providers {
    azurerm = {
      version = "~> 3.9.0"
    }
  }
}

# Asagida iki farkli subscription icin iki farkli provider tanimlandi.
# Bu provider'larin her birine bir alias verildi. 
# Alias kullanilarak her bir resource için hangi provider'in kullanilacagi belirtilebilir.

provider "azurerm" {
  subscription_id = ""
  alias           = "sub1"
  features {}
}

provider "azurerm" {
  subscription_id = ""
  alias           = "sub2"
  features {}
}

resource "azurerm_resource_group" "rg" {
  provider = azurerm.sub1
  name     = "rg-sub1"
  location = "westeurope"
}

resource "azurerm_resource_group" "rg2" {
  provider = azurerm.sub2
  name     = "rg-sub2"
  location = "westeurope"
}
