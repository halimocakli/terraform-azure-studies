# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myRg" {
  name     = "halims-rg-2"
  location = "East US"
}