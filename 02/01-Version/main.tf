
# Herhangi bir versiyon belirtilmediğinde, Terraform en son sürümü kullanır.
# Provider ile uyuşmazlık yaşamamak adına ya da sonradan ortaya çıkacak yeniliklerin takip edilebilmesi için,
# Terraform ve Azure sağlayıcısının belirli bir sürümünü kullanmak daha sağlıklı olabilir.
# Bu sürümleri belirtmek için "required_version" ve "required_providers" blokları kullanılır.
terraform {
  required_version = ">= 1"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.20"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "resource_group_name" {
  default = "rg_test"
  type    = string
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = "westeurope"
}

resource "azurerm_public_ip" "pip" {
  name                = "book-ip-halim"
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  domain_name_label   = "bookdevopshalim"
}
