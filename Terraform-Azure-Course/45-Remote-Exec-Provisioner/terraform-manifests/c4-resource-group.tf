resource "azurerm_resource_group" "myRg" {
  name     = local.rg_name
  location = local.rg_location
  tags     = local.common_tags
}
