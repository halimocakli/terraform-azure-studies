// Terraform State'in birincil amacı, uzak bir sistemdeki nesneler ile yapılandırmanızda bildirilen kaynak örnekleri arasındaki 
// bağları depolamaktır. Terraform, herhangi bir yapılandırma değişikliğine yanıt olarak bir uzak nesne oluşturduğunda, bu uzak nesnenin 
// kimliğini belirli bir kaynak örneğine kaydedecek ve daha sonra gelecekteki yapılandırma değişikliklerine yanıt olarak bu nesneyi 
// potansiyel olarak güncelleyecek veya silecektir.

// Aşağıdaki komutu çalıştırarak lokalde oluşturuduğumuz "myRg" kaynağı ile remote sistemde oluşturduğumuz "tf-state-rg" kaynaklarını bağlıyoruz.
// İlgili değişiklikler "terraform.tfstate" dosyası üzerinden takip edilebilir.

// terraform import azurerm_resource_group.myRg /subscriptions/8d2c06b6-fe9a-4982-b574-6938d83cd958/resourceGroups/tf-state-rg

resource "azurerm_resource_group" "myRg" {
  name     = "tf-state-rg"
  location = "eastus"

  // Resource konfigürasyonu içerisinde "tags" değişkeni oluşturarak ilgili Terraform komutlarını çalıştıracağız.
  // Böylece değişkenin remote sisteme yansıyıp yansımadığını test etmiş olacağız.

  tags = {
    "TestTag1" = "tag-for-test-1"
    "TestTag2" = "tag-for-test-2"
  }

}
