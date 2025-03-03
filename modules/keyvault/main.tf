data "azurerm_client_config" "current" {}

module "key_vault" {
  source  = "Azure/avm-res-keyvault-vault/azurerm"
  version = "0.9.1"

  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tags                          = var.tags
  tenant_id                     = var.tenant_id
  public_network_access_enabled = true

  diagnostic_settings = var.diagnostic_settings


  private_endpoints = {
    primary = {
      private_dns_zone_resource_ids = var.private_dns_zone_resource_ids
      subnet_resource_id            = var.subnet_resource_id
      subresource_name              = ["vault"]
      tags                          = var.tags
    }
  }

  role_assignments = {
    deployment_user_secrets = {
      role_definition_id_or_name = "Key Vault Administrator"
      principal_id               = data.azurerm_client_config.current.object_id
    }
  }

}