terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.20"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg-app" {
  name     = "RG-APP-IMPORT-BLOCK"
  location = "westeurope"
}

import {
  id = "/subscriptions/8d2c06b6-fe9a-4982-b574-6938d83cd958/resourcegroups/RG-APP-IMPORT-BLOCK"
  to = azurerm_resource_group.rg-app
}
