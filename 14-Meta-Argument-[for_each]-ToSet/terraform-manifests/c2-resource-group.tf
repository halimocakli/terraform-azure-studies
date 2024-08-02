# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myRg" {
  for_each = toset(["eastus", "eastus2", "westus"])
  name     = "myRg-${each.value}"
  location = each.key

  # Set yapısı için "each.key" ile "each.value" aynıdır.
}
