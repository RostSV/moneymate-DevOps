resource "azurerm_public_ip" "fsa_public_ip" {
  name                = "pip-${var.resource_name}"
  resource_group_name = var.resource_group
  location            = var.location
  allocation_method   = "Static"
  domain_name_label   = var.dns_label
  sku                 = "Standard"

  tags = {
    environment = var.environment
  }
}