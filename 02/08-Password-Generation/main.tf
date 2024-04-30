# Specify the required Terraform version and providers
terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      version = "~> 3.18"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }
  }
}

# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Create a resource group in Azure
resource "azurerm_resource_group" "my-terraform-rg" {
  name     = "halimsResourceGroup-Demo"
  location = "westeurope"
}

# Create a virtual network in Azure
resource "azurerm_virtual_network" "my-terraform-vnet" {
  name                = "halimsVnet-Demo"
  location            = azurerm_resource_group.my-terraform-rg.location
  resource_group_name = azurerm_resource_group.my-terraform-rg.name
  address_space       = ["10.0.0.0/16"]
}

# Create a subnet in the virtual network
resource "azurerm_subnet" "my-terraform-subnet" {
  name                 = "halimsSubnet-Demo"
  resource_group_name  = azurerm_resource_group.my-terraform-rg.name
  virtual_network_name = azurerm_virtual_network.my-terraform-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Create a public IP address in Azure
resource "azurerm_public_ip" "my-terraform-pip" {
  name                = "halimsPublicIP-Demo"
  location            = azurerm_resource_group.my-terraform-rg.location
  resource_group_name = azurerm_resource_group.my-terraform-rg.name
  allocation_method   = "Dynamic"
}

# Create a network security group in Azure
resource "azurerm_network_security_group" "my-terraform-nsg" {
  name                = "halimsNetworkSecurityGroup-Demo"
  location            = azurerm_resource_group.my-terraform-rg.location
  resource_group_name = azurerm_resource_group.my-terraform-rg.name

  # Define a security rule for the network security group
  security_rule {
    name                       = "SSH"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Create a network interface in Azure
resource "azurerm_network_interface" "my-terraform-nic" {
  name                = "halimsNIC-Demo"
  location            = azurerm_resource_group.my-terraform-rg.location
  resource_group_name = azurerm_resource_group.my-terraform-rg.name

  # Define an IP configuration for the network interface
  ip_configuration {
    name                          = "myNicConfiguration"
    subnet_id                     = azurerm_subnet.my-terraform-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.my-terraform-pip.id
  }
}

# Generate a random password
resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!@#$%&*"
}

# Create a Linux virtual machine in Azure
resource "azurerm_linux_virtual_machine" "my-terraform-vm" {
  name                            = "halimsVM-Demo"
  location                        = azurerm_resource_group.my-terraform-rg.location
  resource_group_name             = azurerm_resource_group.my-terraform-rg.name
  network_interface_ids           = [azurerm_network_interface.my-terraform-nic.id]
  disable_password_authentication = false
  computer_name                   = "vmdemo"
  admin_username                  = "uservm"
  admin_password                  = random_password.password.result
  size                            = "Standard_DS1_v2"

  # Define the OS disk for the virtual machine
  os_disk {
    name                 = "myOsDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  # Define the source image for the virtual machine
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "19.04"
    version   = "latest"
  }
}
