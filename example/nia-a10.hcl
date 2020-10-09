log_level = "INFO"
consul {
  address = "34.73.82.31:8500"
}

buffer_period {
  min = "5s"
  max = "20s"
}

service {
  name       = "web"
  datacenter = "us-east1"
}

driver "terraform" {
  required_providers {
    vthunder = {
      source = "a10networks/thunder"
    }
  }
}

provider "vthunder" {
  address  = "54.166.184.68"
  username = "admin"
  password = "a10"
}

task {
  name        = "demo-test"
  description = "automate services for website-x"
  source      = "/Users/dcallao/Documents/workspace/repos/consul-nia/consul-nia-vthunder"
  #version = "v0.1.0"
  providers   = ["vthunder"]
  services    = ["web","db"]
  variable_files = "/Users/dcallao/Documents/workspace/repos/consul-nia/consul-nia-vthunder/example/terraform.tfvars"
}
