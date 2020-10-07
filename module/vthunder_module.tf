resource "vthunder_service_group" "sg1" {
  for_each = var.services
  name     = each.value.name
  protocol = "TCP"

  dynamic "member_list" {
    for_each = var.services
    content {
      name = member_list.value.id
      port = member_list.value.port
      host = member_list.value.address
    }
  }
}

#output "services_output" {
#  value = local.grouped
#}

#output "services_ids" {
#  value = local.service_ids
#}

locals {
  service_ids = transpose({
      for id, s in var.services : id => [s.name]
  })
#  grouped = {
#      for name, ids in local.service_ids:
#      name => {
#      }
#  }
}
output "services_output" {
  value = local.grouped
}
locals {
  grouped = {
    for name, ids in local.service_ids:
      name => [for id in ids : var.services[id]]
  }
}
