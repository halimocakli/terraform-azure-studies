terraform {
  required_version = "~> 1.1"
  required_providers {
    azurerm = {
      version = "~> 3.23"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "random_string" "randomstr" {
  length  = 5
  special = false
  upper   = false
}

locals {
  webapp_list = ["halimswebapp1", "halimswebapp2"]
}

resource "azurerm_resource_group" "rg-app" {
  name     = "RG_CustomApp_Demo_Loop_${random_string.randomstr.result}"
  location = "West Europe"
}

module "multiple_webapp" {
  source   = "../WebAppModule"
  for_each = toset(local.webapp_list)

  app_name              = "${each.key}-${random_string.randomstr.result}"
  service_plan_name     = "spmyapp-${each.key}-${random_string.randomstr.result}"
  location              = azurerm_resource_group.rg-app.location
  resource_group_name   = azurerm_resource_group.rg-app.name
  operating_system_type = "Linux"
}

output "app_service_urls" {
  value = values(module.multiple_webapp)[*].webapp_url
}

output "webapp_ids" {
  value = values(module.multiple_webapp)[*].webapp_id
}
