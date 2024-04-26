# see https://github.com/hashicorp/terraform
terraform {
  required_version = ">= 1.7.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.93.0"
    }
  }
}

# see https://github.com/terraform-providers/terraform-provider-azurerm
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  client_id       = var.client_id
  client_secret   = var.client_secret
}