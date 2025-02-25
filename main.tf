resource "random_pet" "unique_name" {
  length    = 2
  separator = "-"
}

module "resource_group" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.2.1"
  location = var.location
  name     = local.resource_group_name
  tags     = var.tags
}

module "log_analytics_workspace" {
  source              = "./modules/log_analytics_workspace"
  name                = local.log_analytics_workspace_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}


module "key_vault" {
  source                        = "./modules/keyvault"
  name                          = local.key_vault_name
  location                      = var.location
  resource_group_name           = module.resource_group.name
  tags                          = var.tags
  diagnostic_settings           = local.diagnostic_settings
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  private_dns_zone_resource_ids = [module.private_dns_zone_key_vault.resource_id]
  subnet_resource_id            = module.virtual_network.subnets["private_endpoints"].resource_id
  depends_on = [ module.private_dns_zone_key_vault , module.virtual_network]
}
