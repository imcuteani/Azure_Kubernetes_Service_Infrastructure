# Terraform Providers declaration
provider "azurerm" {
  version = "~>2.0"
  features {}

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

}

terraform {

  required_version = ">=0.14"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = var.storage_account_rg
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.storage_key
  }
}
