resource "azurerm_resource_group" "fsa_rsvistula" {
  name     = var.resource_group
  location = var.location

  lifecycle {
    prevent_destroy = true
  }
}