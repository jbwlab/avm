terraform {
  required_version = "~> 1.10"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.19"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  # backend "azurerm" {
  #   resource_group_name = "rg-lab-terraform"
  #   storage_account_name = "stlabtfst"
  #   container_name = "tfstate"
  #   key = "avm-lab.tfstate"
  #   //se_azuread_auth = true
  # }
}

#az ad sp create-for-rbac --name "iac_deployment" --role contributor --scopes /subscriptions/8d5d976b-d18a-405b-b99b-e3ea7a51c5e0 --sdk-auth

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false # This is to handle MCAPS or other policy driven resource creation.
    }
  }
  resource_provider_registrations = "extended"

}
