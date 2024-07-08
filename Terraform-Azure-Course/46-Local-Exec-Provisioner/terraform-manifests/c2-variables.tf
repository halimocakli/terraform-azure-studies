# Girdi değişkenlerini(Input Variables) bu kısımda tanımlamaktayız
variable "business_unit" {
  description = "Bussiness Unit Name"
  type        = string
  default     = "human resources"
}

variable "environment" {
  description = "Environment Name"
  type        = string
  default     = "dev-env"
}

variable "resoure_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "myRg"
}

variable "resoure_group_location" {
  description = "Resource Group Location"
  type        = string
  default     = "eastus"
}

variable "virtual_network_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "myVnet"
}

variable "subnet_name" {
  description = "Virtual Network Subnet Name"
  type        = string
}

variable "public_ip_name" {
  description = "Public IP Name"
  type        = string
}

variable "network_interface_name" {
  description = "Network Interface Name"
  type        = string
}

variable "virtual_machine_name" {
  description = "Virtual Machine Name"
  type        = string
}
