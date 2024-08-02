# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myRg" {
  count    = 3
  name     = "halims-rg-${count.index}"
  location = "East US"
}
