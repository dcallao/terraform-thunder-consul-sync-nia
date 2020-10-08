log_level = "INFO"
consul {
  address = "10.65.22.163:8500"
}

buffer_period {
  min = "5s"
  max = "20s"
}

service {
  name       = "api"
  datacenter = "dc1"
}

task {
  name        = "slb"
  description = "automate services for website-x"
  source      = "/Users/aditya/Cooking/Office/ConsulNIA/module"
  variable_files = ["/Users/aditya/Cooking/Office/ConsulNIA/custom_vars.tfvars"]
  providers   = ["vthunder"]
  services    = ["consul", "test_up_down"]
}

driver "terraform" {
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
