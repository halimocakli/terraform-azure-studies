# Define the application name variable
variable "application_name" {
  description = "The name of the application"
  type        = string
}

# Define the environment name variable
variable "environment_name" {
  description = "The name of environment"
  type        = string
}

# Define the country code variable
variable "country_code" {
  description = "The country code (FR-US-TR-...)"
  type        = string
}

# Create a resource group in Azure
resource "azurerm_resource_group" "rg" {
  name     = "RG-${local.resource_name}"
  location = "westeurope"
}

# Create a public IP in Azure
resource "azurerm_public_ip" "pip" {
  name                = "IP-${local.resource_name}"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  domain_name_label   = "halimsdomain"
}

# Define a local value for the resource name
# Local variables reachs variables and resources only in the same file
locals {
  resource_name = "${var.application_name}-${var.environment_name}-${var.country_code}"
}
