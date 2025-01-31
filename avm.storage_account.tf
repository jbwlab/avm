module "avm-res-storage-storageaccount" {
  source  = "Azure/avm-res-storage-storageaccount/azurerm"
  version = "0.4.0"

  location            = azurerm_resource_group.this.location
  name                = local.storage_account_name
  resource_group_name = azurerm_resource_group.this.name
  tags                = var.tags


  containers = {
    demo = {
      name                  = "demo"
      container_access_type = "private"
    }
  }

  }
