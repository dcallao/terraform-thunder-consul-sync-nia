# This file is generated by Consul NIA.
#
# The HCL blocks, arguments, variables, and values are derived from the
# operator configuration for Consul NIA. Any manual changes to this file
# may not be preserved and could be clobbered by a subsequent update.

# Service definition protocol v0
variable "services" {
  description = "Consul services monitored by Consul NIA"
  type = map(
    object({
      id        = string
      name      = string
      address   = string
      port      = number
      meta      = map(string)
      tags      = list(string)
      namespace = string
      status    = string

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
