resource "azurerm_virtual_network" "myVnet" {
  name                = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name
}

resource "azurerm_subnet" "mySubnet" {
  name                 = "mysubnet-1"
  resource_group_name  = azurerm_resource_group.myRg.name
  virtual_network_name = azurerm_virtual_network.myVnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "myPublicIp" {
  name                = "mypublicip-1"
  resource_group_name = azurerm_resource_group.myRg.name
  location            = azurerm_resource_group.myRg.location
  allocation_method   = "Static"
  domain_name_label   = "api1-vm-${random_string.myRandomString.id}"
  tags = {
    environment = "Dev"
  }
}

resource "azurerm_network_interface" "myVmNic" {
  name                = "vmnic"
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myPublicIp.id
  }
}
