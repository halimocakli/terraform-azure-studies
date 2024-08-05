/*
  1- "ignore_changes = [tags]" ifadesi aktif olmaksızın "plan" ve "apply" komutlarını çalıştır.
  2- Azure Portal üzerinde oluşan VM kaynağına manuel olarak tag eklemesi yap. [WebServer = Apache]
  3- "ignore_changes = [tags]" ifadesi aktif olmaksızın "plan" ve "apply" komutlarını çalıştır.
  4- Oluşan çıktıya göre manuel olarak eklenen tag değerleri Azure Portal üzerinden silinektir, teyit et.
  5- Azure Portal üzerindeki VM kaynağına manuel olarak tag eklemesi yap. [WebServer = Apache]
  6- "ignore_changes = [tags]" ifadesini aktive ederek "plan" ve "apply" komutlarını çalıştır.
  7- Oluşan çıktıya göre manuel olarak eklenen tag değerleri Azure Portal üzerinde kalacaktır, teyit et.
*/

resource "azurerm_virtual_network" "myVnet" {
  # name              = "myvnet-2"
  name                = "myvnet-1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.myRg.location
  resource_group_name = azurerm_resource_group.myRg.name
  tags = {
    "Name"        = "VNET-1"
    "Environment" = "DEV1"
    "Project"     = "Lifecycle"
  }

  # Lifecycle Changes
  lifecycle {
    ignore_changes = [tags]
  }
}





