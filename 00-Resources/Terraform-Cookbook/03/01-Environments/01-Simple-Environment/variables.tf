variable "resource_group_name" {
  type        = string
  description = "Resource-Group name"
}

variable "location" {
  type        = string
  description = "Location of Azure reource"
  default     = "westeurope"
}

variable "service_plan_name" {
  type        = string
  description = "Service plan name"
}

variable "app_name" {
  type        = string
  description = "Name of application"
  default     = "SampleApp"
}

variable "environment" {
  type        = string
  description = "Environment Name"
}

variable "createdby" {
  type        = string
  description = "Name of the triggers user"
  default     = "NA"
}
