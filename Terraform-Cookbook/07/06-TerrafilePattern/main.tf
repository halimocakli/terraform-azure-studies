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
  features {}
}


resource "random_string" "random" {
  length  = 4
  special = false
  upper   = false
}

module "resourcegroup" {
  source              = "./modules/rg-master"
  resource_group_name = "RG_HalimsApp_Demo-${random_string.random.result}"
  location            = "West Europe"
}

module "webapp" {
  source              = "./modules/webapp-1.0.0"
  service_plan_name   = "halimsdemoappservice-${random_string.random.result}"
  app_name            = "halimsdemoapp-${random_string.random.result}"
  location            = "West Europe"
  resource_group_name = module.resourcegroup.resource_group_name
}

module "network" {
  source                  = "./modules/network-5.3.0"
  resource_group_name     = module.resourcegroup.resource_group_name
  resource_group_location = "West Europe"
  address_space           = "10.0.0.0/16"
  subnet_prefixes         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names            = ["subnet1", "subnet2", "subnet3"]
  use_for_each            = true
}
