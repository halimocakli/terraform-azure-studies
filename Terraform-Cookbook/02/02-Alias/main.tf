# Bu blok, gereken Terraform ve Azure sağlayıcısının gereken sürümünü belirtir
terraform {
  required_version = "~> 1.1"
  required_providers {
    azurerm = {
      version = "~> 3.9.0"
    }
  }
}

# Bu blok, ilk abonelik için Azure sağlayıcısını tanımlar.
# "sub1" takma adı, kodun diğer bölümlerinde bu sağlayıcıya atıfta bulunmak için kullanılır.
provider "azurerm" {
  subscription_id = "" # İlk Azure aboneliği için abonelik ID'si
  alias           = "sub1"
  features {} # Bu blok Azure sağlayıcısı tarafından gereklidir, ancak boş bırakılabilir
}

# Bu blok, ikinci abonelik için Azure sağlayıcısını tanımlar.
# "sub2" takma adı, kodun diğer bölümlerinde bu sağlayıcıya atıfta bulunmak için kullanılır.
provider "azurerm" {
  subscription_id = "" # İkinci Azure aboneliği için abonelik ID'si
  alias           = "sub2"
  features {} # Bu blok Azure sağlayıcısı tarafından gereklidir, ancak boş bırakılabilir
}

# Bu blok, ilk Azure aboneliğinde bir kaynak grubu oluşturur
resource "azurerm_resource_group" "rg" {
  provider = azurerm.sub1 # Bu kaynağın ilk abonelikte oluşturulması gerektiğini belirtir
  name     = "rg-sub1"    # Kaynak grubunun adı
  location = "westeurope" # Kaynak grubunun oluşturulacağı konum
}

# Bu blok, ikinci Azure aboneliğinde bir kaynak grubu oluşturur
resource "azurerm_resource_group" "rg2" {
  provider = azurerm.sub2 # Bu kaynağın ikinci abonelikte oluşturulması gerektiğini belirtir
  name     = "rg-sub2"    # Kaynak grubunun adı
  location = "westeurope" # Kaynak grubunun oluşturulacağı konum
}
