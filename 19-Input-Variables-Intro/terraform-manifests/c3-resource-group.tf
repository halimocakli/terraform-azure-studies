# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myRg" {
  # name     = "halims-rg-${random_string.myRandomString.id}"
  name     = "${var.business_unit}-${var.environment}-${var.resource_group_name}"
  location = var.resource_group_location
}
