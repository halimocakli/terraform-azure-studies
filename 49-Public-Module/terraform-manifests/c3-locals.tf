# Local Values Block
locals {
  rg_name   = "${var.business_unit}-${terraform.workspace}-${var.resoure_group_name}"
  vnet_name = "${var.business_unit}-${terraform.workspace}-${var.virtual_network_name}"
  snet_name = "${var.business_unit}-${terraform.workspace}-${var.subnet_name}"
  pip_name  = "${var.business_unit}-${terraform.workspace}-${var.publicip_name}"
  nic_name  = "${var.business_unit}-${terraform.workspace}-${var.network_interface_name}"
  vm_name   = "${var.business_unit}-${terraform.workspace}-${var.virtual_machine_name}"

  service_name = "Demo Services"
  owner        = "Halim Can Ocakli"
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }
}
