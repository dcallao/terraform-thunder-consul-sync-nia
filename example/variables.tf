variable "services" {
  description = "Consul services monitored by consul-terraform-sync"
  type = map(
    object({
      id                    = string
      name                  = string
      address               = string
      port                  = number
      status                = string
      meta                  = map(string)
      tags                  = list(string)
      namespace             = string
      node                  = string
      node_id               = string
      node_address          = string
      node_datacenter       = string
      node_tagged_addresses = map(string)
      node_meta             = map(string)
    })
  )
}

variable "vthunder" {
  default     = null
  description = "Configuration object for vthunder"
  type = object({
    address  = string
    password = string
    username = string
  })
}

variable "slb_service_group_protocol" {
  description = "Protocol of the Consul services in service group"
  type    = string
  default = "udp"
}

variable vthunder_host {}
variable vthunder_user {}
variable vthunder_passwd {}
