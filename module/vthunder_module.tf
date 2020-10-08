resource "vthunder_service_group" "service-group" {
  for_each = local.grouped
  name     = each.key
  protocol = "TCP"

  dynamic "member_list" {
    for_each = each.value
    
    content {
      name = member_list.value.address
      port = member_list.value.port
      host = member_list.value.address
    }
  
  }
}

locals {
  service_ids = transpose({
      for id, s in var.services : id => [s.name]
  })
}

output "services_idss" {
  value = local.service_ids
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
