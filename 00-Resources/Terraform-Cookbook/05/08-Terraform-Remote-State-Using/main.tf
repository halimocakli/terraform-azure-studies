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
  name     = "${var.resource_group_name}-${var.environment}"
  location = var.location
  tags = {
    ENV = var.environment
  }
}

data "terraform_remote_state" "service_plan_tfstate" {
  backend = "azurerm"
  config = {
    resource_group_name  = "rg_tfstate"
    storage_account_name = "halimsdemostorstate"
    container_name       = "tfbackends"
    key                  = "serviceplan.tfstate"
  }
}

resource "azurerm_windows_web_app" "app" {
  name                = "${var.app_name}-${var.environment}"
  location            = azurerm_resource_group.rg-app.location
  resource_group_name = azurerm_resource_group.rg-app.name
  service_plan_id     = local.remote_state_service_plan_id
  site_config {}
}

locals {
  remote_state_service_plan_id = data.terraform_remote_state.service_plan_tfstate.outputs.service_plan_id
}
