terraform {
  required_version = "~> 1.1"
  required_providers {
    azurerm = {
      version = "~> 3.23"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "RG-App-Refactore-Book"
  location = "westeurope"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "vnet1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

/*
  İlk olarak aşağıdaki script init, validate, plan ve apply komutları ile çalıştırılarak kaynakları dağıtılır.
  Bu kaynakların dağıtımından sonra ise kodların refactoring işlemi gerçekleştirilir. Refactoring işlemi için;

    * terraform state mv 'azurerm_subnet.snet1' 'azurerm_subnet.snetlist[\"subnet1\"]'
    * terraform state mv 'azurerm_subnet.snet2' 'azurerm_subnet.snetlist[\"subnet2\"]'

  ifadeleri CLI üzerinden girilir. Bu sayede hali hazırda var olan kaynaklar silinmeden script-2'de gerçekleştirilmek
  istenen refactoring işlemi tamamlanmış olur. Refactoring işleminin ardından Script-2 yorum satırından çıkarılır ve 
  Script-1 yorum satırına alınır.

  Bu işlemlerin tıpatıp aynısını Moved Block ile de yapabiliriz. İkinci kısımda inceleyiniz.
*/

### Script - 1

resource "azurerm_subnet" "snet1" {
  name                 = "subnet1"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "snet2" {
  name                 = "subnet2"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

### Script - 2

# locals {
#   subnet_list = {
#     subnet1 = "10.0.1.0/24"
#     subnet2 = "10.0.2.0/24"
#   }
# }

# resource "azurerm_subnet" "snetlist" {
#   for_each             = local.subnet_list
#   name                 = each.key
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = [each.value]
# }
