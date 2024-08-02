# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myRg" {
  name     = "halims-rg-${random_string.myRandomString.id}"
  location = "westus"
}
