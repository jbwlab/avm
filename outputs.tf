output "names" {
  value = {
    resource_group_name         = module.resource_group.name
    log_analytics_workspace_id  = module.log_analytics_workspace.id
    virtual_network_name        = module.virtual_network.name
    virtual_network_id          = module.virtual_network.resource_id
    network_security_group_name = module.network_security_group.name
    network_security_group_id   = module.network_security_group.resource_id
  }
}

output "subnets" {
  value = local.subnets
}


