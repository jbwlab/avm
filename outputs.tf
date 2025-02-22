output "names" {
  value = {
    resource_group_name        = module.resource_group.name
    log_analytics_workspace_id = module.log_analytics_workspace.id
  }
}
