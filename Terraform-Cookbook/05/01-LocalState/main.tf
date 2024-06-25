terraform {
  backend "local" {
    path = "../../00-Temp/demo.tfstate"
  }

  required_version = "~> 1.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}
