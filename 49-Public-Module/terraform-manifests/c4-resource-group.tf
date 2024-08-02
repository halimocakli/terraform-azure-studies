# Resource-1: Azure Resource Group

resource "azurerm_resource_group" "myRg" {
  name     = local.rg_name
  location = var.resoure_group_location
  tags     = local.common_tags
}
