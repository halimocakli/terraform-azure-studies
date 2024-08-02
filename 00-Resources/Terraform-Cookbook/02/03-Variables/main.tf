// Terraform yapılandırma bloğu, gereken sürüm ve sağlayıcıları belirtir
terraform {
  required_version = "~> 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.18"
    }
  }
}

// Azure Resource Manager sağlayıcısını belirtir
provider "azurerm" {
  features {}
}

// Kaynak grubunun adını belirleyen değişkeni tanımlar
variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the resources."
}

// Kaynakların oluşturulacağı konumu belirleyen değişkeni tanımlar
variable "location" {
  type        = string
  description = "The location/region where the resources will be created."
}
