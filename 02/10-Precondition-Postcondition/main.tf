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

variable "address_space" {
  default = "10.0.0.0/16"
  type    = string
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-dep"
  location = "westus"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = [var.address_space]

  lifecycle {
    precondition {
      condition     = cidrnetmask(var.address_space) == "255.255.0.0"
      error_message = "!!! Error: The IP must be /16 !!!"
    }
    postcondition {
      condition     = self.location == "westeurope"
      error_message = "!!! Error: The location must be westeurope !!!"
    }
  }

}


