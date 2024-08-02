# Virtual Network Olusturma
resource "azurerm_virtual_network" "myVnet" {
  name                = local.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name
  tags                = local.common_tags
}

# Subnet Olusturma
resource "azurerm_subnet" "mySubnet" {
  name                 = local.snet_name
  resource_group_name  = azurerm_resource_group.myRg.name
  virtual_network_name = azurerm_virtual_network.myVnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Public IP Address Olusturma
resource "azurerm_public_ip" "myPublicIp" {
  name                = local.pip_name
  resource_group_name = azurerm_resource_group.myRg.name
  location            = azurerm_resource_group.myRg.location
  allocation_method   = "Static"
  domain_name_label   = "halimapp1-${terraform.workspace}-${random_string.myRandomString.id}"
  tags                = local.common_tags
}

# Network Interface Olusturma
resource "azurerm_network_interface" "myVmNic" {
  name                = local.nic_name
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myPublicIp.id
  }
  tags = local.common_tags
}
