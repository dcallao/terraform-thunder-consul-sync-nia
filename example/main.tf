terraform {
  required_providers {
    vthunder = {
      source = "a10networks/thunder"
      version = "0.4.7"
    }
  }
  required_version = "~>0.13.0"
}



provider "vthunder" {
  address  = var.vthunder_host
  username = var.vthunder_user
  password = var.vthunder_passd
}

module "vthunder_module" {
  source   = "../"
  services = var.services
  protocol = var.slb_service_group_protocol
}
