# Resource: Azure Linux Virtual Machine
resource "azurerm_linux_virtual_machine" "myLinuxVm" {
  name                  = local.vm_name
  computer_name         = local.vm_name # Hostname of the VM
  resource_group_name   = azurerm_resource_group.myRg.name
  location              = azurerm_resource_group.myRg.location
  size                  = "Standard_DS1_v2"
  admin_username        = "azureuser"
  network_interface_ids = [azurerm_network_interface.myVmNic.id]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
  }

  os_disk {
    name                 = "osdisk${random_string.myRandomString.id}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "83-gen2"
    version   = "latest"
  }

  custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
  tags        = local.common_tags

  provisioner "local-exec" {
    command     = "Write-Output \"Creation Time - $(Get-Date): VM IP: ${azurerm_linux_virtual_machine.myLinuxVm.public_ip_address}\" >> vm-ip-creation-time-record.txt"
    interpreter = ["PowerShell", "-Command"]
    working_dir = "local-exec-output-files/"
  }

  provisioner "local-exec" {
    when        = destroy
    command     = "Write-Output \"Destroy-time provisioner Instance Destroyed at $(Get-Date)\" >> destroy-time-record.txt"
    interpreter = ["PowerShell", "-Command"]
    working_dir = "local-exec-output-files/"
  }
}

