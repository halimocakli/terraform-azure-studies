# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myRg" {
  name     = "halims-rg-1"
  location = "East US"
}
