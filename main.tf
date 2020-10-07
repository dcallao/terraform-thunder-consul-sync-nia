terraform {
  required_version = "~>0.13.0"
  required_providers {
    vthunder = {
      source = "a10networks/vthunder"
      #source = "terraform-providers/vthunder"
    }
  }
}

provider "vthunder" {
  address  = "10.65.22.161"
  username = "admin"
  password = "a10"
}

module "vthunder_module" {
  source   = "./module"
  services = var.services
}

