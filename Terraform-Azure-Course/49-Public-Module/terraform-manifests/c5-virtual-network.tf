# Virtual Network Olusturma
# resource "azurerm_virtual_network" "myVnet" {
#   name                = local.vnet_name
#   address_space       = ["10.0.0.0/16"]
#   location            = azurerm_resource_group.myRg.location
#   resource_group_name = azurerm_resource_group.myRg.name
#   tags                = local.common_tags
# }

# Subnet Olusturma
# resource "azurerm_subnet" "mySubnet" {
#   name                 = local.snet_name
#   resource_group_name  = azurerm_resource_group.myRg.name
#   virtual_network_name = azurerm_virtual_network.myVnet.name
#   address_prefixes     = ["10.0.2.0/24"]
# }

# Create Virtual Networks and Subnets using Terraform Public Registry Module
module "vnet" {
  use_for_each        = var.use_for_each
  source              = "Azure/vnet/azurerm"
  version             = "4.1.0"
  vnet_name           = local.vnet_name
  resource_group_name = azurerm_resource_group.myRg.name
  vnet_location       = var.resoure_group_location
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  subnet_names        = ["subnet1", "subnet2", "subnet3"]

  subnet_service_endpoints = {
    subnet2 = ["Microsoft.Storage", "Microsoft.Sql"],
    subnet3 = ["Microsoft.AzureActiveDirectory"]
  }

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.myRg]
}

# Public IP Address Olusturma
resource "azurerm_public_ip" "myPublicIp" {
  name                = local.pip_name
  resource_group_name = azurerm_resource_group.myRg.name
  location            = azurerm_resource_group.myRg.location
  allocation_method   = "Static"
  domain_name_label   = "halimapp1-${terraform.workspace}-${random_string.myRandom.id}"
  tags                = local.common_tags
}

# Network Interface Olusturma
resource "azurerm_network_interface" "myVmNic" {
  name                = local.nic_name
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = module.vnet.vnet_subnets[0]
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.myPublicIp.id
  }
  tags = local.common_tags
}
