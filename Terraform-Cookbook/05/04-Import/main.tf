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

# Halihazırda var olan Azure Subscription bilgileri alınır.
# Azure Portal üzerinde RG'ye girip Resource ID bilgisine erişilir.
# terraform import azurerm_resource_group.rg-app "ResourceID" prototipi uygulanır ve portal üzerindeki kaynak terraform.state dosyasına import edilir.
data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "rg-app" {
  name     = "RG-APP-IMPORT-${substr(data.azurerm_subscription.current.subscription_id, 0, 5)}"
  location = "westeurope"
}
