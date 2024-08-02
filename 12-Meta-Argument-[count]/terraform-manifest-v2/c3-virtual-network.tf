# Create Virtual Network
resource "azurerm_virtual_network" "myVnet" {
  name                = "myvnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name
}

# Create Subnet
resource "azurerm_subnet" "mySubnet" {
  name                 = "mysubnet-1"
  resource_group_name  = azurerm_resource_group.myRg.name
  virtual_network_name = azurerm_virtual_network.myVnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Create Public IP Address
resource "azurerm_public_ip" "myPublicIp" {
  count               = 2
  name                = "mypublicip-${count.index}"
  resource_group_name = azurerm_resource_group.myRg.name
  location            = azurerm_resource_group.myRg.location
  allocation_method   = "Static"
  domain_name_label   = "halims-app-vm-${count.index}-${random_string.myRandomString.id}"
  tags = {
    environment = "Dev"
  }
}

# Create Network Interface
resource "azurerm_network_interface" "myVmNic" {
  count               = 2
  name                = "vmnic-${count.index}"
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mySubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = element(azurerm_public_ip.myPublicIp[*].id, count.index)
  }
}
