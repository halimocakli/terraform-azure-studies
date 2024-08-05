# "prevent_destroy = true" ifadesi ilgili kaynağın destroy edilmemesini engeller
# Create Virtual Network
resource "azurerm_virtual_network" "myVnet" {
  # name              = "myvnet-2"
  name                = "myvnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name


  # Lifecycle Changes
  # lifecycle {
  #   prevent_destroy = true
  # }
}





