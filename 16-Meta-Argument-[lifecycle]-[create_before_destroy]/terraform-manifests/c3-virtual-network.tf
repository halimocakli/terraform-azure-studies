# İlk olarak, name değişkeni "myvnet-1" iken resource create edip sonrasında name değişkenini "myvnet-2" olacak şekilde 
# değiştirip Terraform davranışını inceleyeceğiz. Sonrasında ise "lifecycle" bloğunu aktif ederek name değişkenini 
# "myvnet-1" olacak şekilde değiştirip süreci inceleyeceğiz.
# Create Virtual Network
resource "azurerm_virtual_network" "myVnet" {
  # name              = "myvnet-2"
  name                = "myvnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name


  # Lifecycle Changes
  # lifecycle {
  #   create_before_destroy = true
  # }
}





